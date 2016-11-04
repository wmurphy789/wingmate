class Api::V1::UsersController < Api::V1::ApiController
	def check_usernames
		usernames = params[:users]
		bad_users = []
		for u in usernames
			if !User.where(username: u).exists?
				bad_users.push(u)
			end
		end

		if bad_users.length < 1
			if params[:type] == "Timed"
				@league = League.create(name: params["name"], league_type: params[:type], timed: DateTime.parse(params[:duration].to_s, , admin_id: current_user.id)
			else
				@league = League.create(name: params["name"], league_type: params[:type], points: params[:duration], admin_id: current_user.id)
			end

			for u in usernames
				user = User.where(username: u).first
				LeagueUser.create(league_id: @league.id,user_id: user.id,active: 0, points: 0) if user.id != current_user.id
				LeagueUser.create(league_id: @league.id,user_id: user.id,active: 1, points: 0) if user.id == current_user.id
			end
		end

		respond_to do |format|
	      format.json { render status: 200, json: {bad_users: bad_users} }
	    end
	end

	def get_profile
		##
		## add up some of points for user for all leagues, check for points highest
		##
		p = 0
		winner = League.where(winner_id: current_user.id).count
		points = LeagueUser.where(user_id: current_user.id).all
		points.each { |x| p += x.points.to_i }
		leagues = LeagueUser.where(user_id: current_user.id, active: 1).count

		respond_to do |format|
	      format.json { render status: 200, json: {winner: winner, points: p, leagues: leagues} }
	    end
	end

	def recover_password
	    @user = User.where(email: params[:email])
	    if @user.present?
	      @user.send_reset_password_instructions
	      respond_to do |format|
	  	      format.json { render status: 200, json: {message: 'success'} }
	  	    end
	    else
	      respond_to do |format|
	  	      format.json { render status: 404, json: { message: 'Email Not Found'} }
	  	    end
	    end
	end
end
