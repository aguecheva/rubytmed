class Api::SessionsController < Api::BaseController
  def login
    user = User.find_by(username: username)

    return head :forbidden unless user.present? && user.authenticate(password)

    render json: { token: user.private_api_key }
  end
end
