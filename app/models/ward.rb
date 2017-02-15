class Ward < ApplicationRecord
  has_many :patient_admissions

  def change_availability
    self.availability -= 1
    self.save!
  end
end
