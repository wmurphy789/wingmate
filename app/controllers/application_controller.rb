class ApplicationController < ActionController::Base

  respond_to :html, :json

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  before_filter :authenticate_user!
  skip_before_filter :authenticate_user!, if: Proc.new {|c| request.path.include?('/auth') || request.path.include?('/recover_password') }


  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

end
