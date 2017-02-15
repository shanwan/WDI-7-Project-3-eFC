class PatientAdmission < ApplicationRecord
  belongs_to :user
  has_one :ward

  # def to_s(digits)
  #   format("%.#{digits}f", self)
  # end

end
