class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true,
        format: {
        with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ ,
        message: 'Nombre de usuario invalido'
    }
    validates :username, presence: true, uniqueness: true,
        length: { in: 3..15 },
        format: {
            with: /\A[a-z-0-9-A-Z]+\z/ ,
            message: 'Nombre de usuario invalido'
        }
        validates :password, length: {minimum:6, maximum:24}


        # SIGUIENTE CODIGO COMENTADO PARA QUE SE GUARDE EN MINUSCULA TANTO USUARIO COMO CONTRASEÑA
        # before_save: downcase_attributes


        # private

        # def downcase_attributes
        #     self.username = username.downcase
        #     self.email = email.downcase
        # end
end
