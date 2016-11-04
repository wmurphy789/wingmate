class LeagueUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :league

	acts_as_paranoid
end
