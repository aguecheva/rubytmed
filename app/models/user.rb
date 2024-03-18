# En tu modelo de User
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

    validates :username, presence: true, uniqueness: true

    validates :password, confirmation: true

    validates :email, presence: true, uniqueness: true,
        format: {
        with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ ,
        message: 'email invalido'
    }
    # validates :username, presence: true, uniqueness: true,
    #     length: { in: 3..15 },
    #     format: {
    #         with: /\A[a-z-0-9-A-Z]+\z/ ,
    #         message: 'Nombre de usuario invalido'
    #     }
    #     validates :password, length: {minimum:6, maximum:24}


        # SIGUIENTE CODIGO COMENTADO PARA QUE SE GUARDE EN MINUSCULA TANTO USUARIO COMO CONTRASEÑA
        # before_save: downcase_attributes


        # private

        # def downcase_attributes
        #     self.username = username.downcase
        #     self.email = email.downcase
        # end
end
