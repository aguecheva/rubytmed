# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_encrypted  :token
  blind_index :token

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, if: :new_record?
  validates :token, uniqueness: true, allow_blank: true

  def set_token!
    self.token = SecureRandom.hex
    save!(validate: false)
  end
end
