class Room < ApplicationRecord
  belongs_to :hospital
  has_many :beds

  validates :number, presence: true
end

