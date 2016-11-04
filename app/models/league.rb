class League < ActiveRecord::Base
	belongs_to :user
	has_many :league_user
end
