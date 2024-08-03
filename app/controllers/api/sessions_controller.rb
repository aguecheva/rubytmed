class Api::SessionsController < Api::BaseController
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
