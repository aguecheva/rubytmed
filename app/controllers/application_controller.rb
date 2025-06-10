class ApplicationController < ActionController::API
#   before_action :authenticate_user!

#   def authenticate_user!
#     token = request.headers['Authorization']&.split(' ')&.last
#     if token && valid_token?(token)
#       # Aquí podrías establecer al usuario actual si es necesario
#     else
#       render json: { error: 'Unauthorized' }, status: :unauthorized
#     end
#   end

#   private

#   def valid_token?(token)
#     begin
#       decoded_token = JWT.decode(token, 'your_secret_key', true, algorithm: 'HS256')
#       # Aquí podrías hacer validaciones adicionales sobre el token si es necesario
#       true
#     rescue JWT::DecodeError
#       false
#     end
#   end
 end
