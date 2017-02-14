class Patient < ApplicationRecord
  has_many :patient_admissions
  has_one :user
end
