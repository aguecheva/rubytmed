class Api::BaseController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::ImplicitRender

  attr_reader :current_user

  before_action :authenticate_user_with_token

  private

  def authenticate_user_with_token
    authenticate_with_http_token do |token, _options|
      @current_user = User.find_by token: token
    end

    return head :unauthorized unless current_user
  end

  def json
    @json ||= HashWithIndifferentAccess.new JSON.parse(request.raw_post)
  rescue
    {}
  end
end
