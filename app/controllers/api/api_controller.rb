class Api::ApiController < ApplicationController
	include DeviseTokenAuth::Concerns::SetUserByToken
	#skip_before_filter :verify_authenticity_token

	respond_to :json
end
