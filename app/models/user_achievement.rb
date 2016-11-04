class UserAchievement < ActiveRecord::Base
	belongs_to :user
	belongs_to :league
	belongs_to :achievement
end
