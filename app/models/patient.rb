class Patient < ApplicationRecord
  has_many :patient_admissions
  has_one :user

  def minus_medisave(claim_medisave)
    self.medisave = self.medisave - claim_medisave.to_i
    if self.medisave < 0
      self.medisave = 0
    end
    self.save!
  end
end
