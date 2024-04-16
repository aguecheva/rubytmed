# En tu modelo de User
class User < ApplicationRecord
  has_many :patients

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

    class Doctor < User


    end

    class Nurse < User

    end

    class Admin < User

    end

end
