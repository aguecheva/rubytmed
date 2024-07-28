# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  encrypts :token
  blind_index :token

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :token, uniqueness: true, allow_blank: true

  def set_token!
    self[:token] = SecureRandom.hex
    save!
    token
  end
end
