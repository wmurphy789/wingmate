class Api::V1::AchievementsController < Api::V1::ApiController
	def index

	end

	def show
		id = params[:id]
		@achievements = Achievement.where(achievement_id: id)

		respond_to do |format|
	      format.json { render status: 200, json: {achievements: @achievements} }
	    end
	end
end
