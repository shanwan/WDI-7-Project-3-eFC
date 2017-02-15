class PatientAdmission < ApplicationRecord
  belongs_to :user
  has_one :ward
end
