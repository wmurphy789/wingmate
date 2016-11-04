module Concerns::V1::User
	extend ActiveSupport::Concern


	module ClassMethods
		def v1_all
		  Concerns::V1::User.v1_all
		end
	end

	def self.v1_all
		User.all
	end

end