class Api::V1::LeaguesController < Api::V1::ApiController
	def index
		logger.debug "current_user: #{current_user.id}"

		@leagues = League.joins("LEFT JOIN league_users ON leagues.id = league_users.league_id").where("league_users.user_id = ? AND league_users.active = 1 AND deleted_at IS NULL",current_user.id).order("created_at DESC")
		@pending = LeagueUser.where(user_id: current_user.id, active: 0).count
		respond_to do |format|
	      format.json { render status: 200, json: {leagues: @leagues, pending: @pending} }
	    end
	end

	def pending
		@leagues = League.joins("LEFT JOIN league_users ON leagues.id = league_users.league_id").where("league_users.user_id = ? AND league_users.active = 0 AND deleted_at IS NULL",current_user.id).order("created_at DESC")

		respond_to do |format|
	      format.json { render status: 200, json: {leagues: @leagues} }
	    end
	end

	def show
		id = params[:id]
		@league = LeagueUser.joins("LEFT JOIN users ON users.id = league_users.user_id").where("league_users.league_id = ? AND league_users.active = 1",id).select('users.*, league_users.points').order("league_users.points DESC")
		@league_name = League.where(id: id).pluck(:name).first

		respond_to do |format|
	      format.json { render status: 200, json: {users: @league, league_name: @league_name} }
	    end
	end

	def add_achievement
		id = params[:id]
		league_id = params[:league_id]

		@leagueUser = LeagueUser.where(user_id: current_user.id, league_id: league_id).first
		@achievement = Achievement.where(id: id).first
		@leagueUser.points = @leagueUser.points.to_i + @achievement.points.to_i
		@leagueUser.save
		
		UserAchievement.create(user_id: current_user.id, league_id: league_id, achievement_id: id)

		respond_to do |format|
	      format.json { render status: 200, json: {success: "OK"} }
	    end
	end

	def add_league
		id = params[:id]

		@leagueUser = LeagueUser.where(user_id: current_user.id, league_id: id).first
		@leagueUser.active = 1;
		@leagueUser.save

		@leagues = League.joins("LEFT JOIN league_users ON leagues.id = league_users.league_id").where("league_users.user_id = ? AND league_users.active = 0 AND deleted_at IS NULL",current_user.id).order("created_at DESC")

		respond_to do |format|
	      format.json { render status: 200, json: {leagues: @leagues} }
	    end
	end

	def remove_league
		id = params[:id]

		@leagueUser = LeagueUser.where(user_id: current_user.id, league_id: id).first
		@leagueUser.destroy

		@leagues = League.joins("LEFT JOIN league_users ON leagues.id = league_users.league_id").where("league_users.user_id = ? AND league_users.active = 0 AND deleted_at IS NULL",current_user.id).order("created_at DESC")

		respond_to do |format|
	      format.json { render status: 200, json: {leagues: @leagues} }
	    end
	end

	def addUser
		username = params[:username]
		id = params[:id]

		if User.where(username: username).exists?
			user = User.where(username: username)
			LeagueUser.create(league_id: id,user_id: user.id,active: 1, points: 0)

			respond_to do |format|
	  	      format.json { render status: 200, json: { message: 'added'} }
	  	    end
		else
			respond_to do |format|
	  	      format.json { render status: 404, json: { message: 'Username not found'} }
	  	    end
		end
	end

	def updateLeague
		name = params[:name]
		id = params[:id]
		duration = params[:duration]

		@league = League.find(id)
		@league.name = name

		if @league.points.nil?
			@league.timed = DateTime.parse(duration.to_s)
		else
			@league.points = duration
		end

		@league.save

		respond_to do |format|
	      format.json { render status: 200, json: {message: "OK"} }
	    end
	end
end
