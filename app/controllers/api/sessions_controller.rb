class Api::SessionsController < Api::BaseController
  skip_before_action :authenticate_user_with_token

  def login
    user = User.find_by(username: params[:username])

    if user.present? && user.authenticate(params[:password])
      token = user.set_token!
      render json: { token: token }
    else
      head :unauthorized
    end
  end
end
