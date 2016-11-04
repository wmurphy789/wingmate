class Api::V1::AchievementTypesController < Api::V1::ApiController
	def index
		@achievements = AchievmentType.all

		respond_to do |format|
	      format.json { render status: 200, json: {achievements: @achievements} }
	    end
	end
end
