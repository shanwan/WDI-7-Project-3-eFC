class PatientAdmission < ApplicationRecord
  belongs_to :patient
  # wardA = Ward.find_by_sql(Select * From wards WHERE ward_type = "A")
  # wardA = Ward.find_by_sql(Select cost_per_day From wards WHERE ward_type = 'A')
  # i need to get the income of the patient who is logged in
  # i need the ward chosen ==> different forms rendered will therefore decide which ward chosen
  # i need to find the range that the income is in formulatable
  # i need to get subsidized percentage
end
