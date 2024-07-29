class Api::BaseController < ActionController::API
  attr_reader :current_user

  before_action :authenticate_user_with_token

  private

  def authenticate_user_with_token
    authenticate_with_http_token do |token, _options|
      @current_user = User.find_by token: token
    end
  end
end
