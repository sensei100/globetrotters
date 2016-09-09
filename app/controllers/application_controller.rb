class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

def after_sign_in_path_for(resource)
  request.env['omniauth.origin'] || root_path
end

private

  def user_not_authorized
    flash[:error] = "You can only edit/delete your own content."
    redirect_to(:back)
  end

end
