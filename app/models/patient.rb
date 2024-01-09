class Patient < ApplicationRecord
    validates :name, presence: true
    validates :lastname , presence: true
    validates :dni , presence: true
    validates :birth_date , presence: true

end
