class Api::SessionsController < Api::BaseController
  def login
    user = User.find_by(username: user_params[:username])

    if user.present? && user.authenticate(user_params[:password])
      token = user.set_token!
      render status: 200, ok: true, json: { token: token }
    else
      head status: 401, ok: false
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
