class Patient < ApplicationRecord

   # enum status: { all_patients: 0, my_patients: 1, inpatients: 2 }

    has_many :consults
  

    has_one_attached :photo

    validates :name, presence: true
    validates :lastname , presence: true
    validates :dni , presence: true
    validates :birth_date , presence: true

end
