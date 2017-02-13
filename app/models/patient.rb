class Patient < ApplicationRecord
  has_many :patient_admissions
end
