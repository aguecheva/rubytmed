class Patient < ApplicationRecord
#    belongs_to :User
    has_many :consults
    has_one_attached :photo

    validates :name, presence: true
    validates :lastname , presence: true
    validates :dni , presence: true
    validates :birth_date , presence: true

end

# class Inpatient < Patient
#     belongs_to :bed
#     has_many :notes

#     validates :admission_date, presence: true

# end
