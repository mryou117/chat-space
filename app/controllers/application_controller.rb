class ApplicationController < ActionController::Base
#   before_action :authenticate_user!
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
#   end
# end

  before_action :basic_auth
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end
  # 環境が本番環境ならtrue、そうでないならfalseを返す

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
