class Bed <  ApplicationRecord
  belongs_to :room
  has_one :inpatient

  validates :number, presence: true
end
