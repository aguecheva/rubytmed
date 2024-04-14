class Hospital < ApplicationRecord

  has_many :rooms


  validates :name, precense: true
  validates :location, presence: true

end
