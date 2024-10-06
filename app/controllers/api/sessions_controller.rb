class Api::SessionsController < Api::BaseController
  skip_before_action :authenticate_user_with_token, only: [:login, :signup]

  def login
    user = User.find_by(username: params[:username])

    if user.present? && user.authenticate(params[:password])
      token = user.set_token!
      render json: { token: token }
    else
      head :unauthorized
    end
  end


  def signup
    user = User.new(username: params[:username], password: params[:password])

    if user.save
      render json: { message: "User created" }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
