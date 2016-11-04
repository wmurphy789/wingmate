class Api::V1::ActivitiesController < Api::V1::ApiController
	def index

	end

	def show
		id = params[:id]
		@activities = UserAchievement.joins("LEFT JOIN users ON users.id = user_achievements.user_id LEFT JOIN achievements ON achievements.id = user_achievements.achievement_id").where(league_id: id).select('users.username, achievements.description, user_achievements.created_at')

		respond_to do |format|
	      format.json { render status: 200, json: {activities: @activities} }
	    end
	end
end
