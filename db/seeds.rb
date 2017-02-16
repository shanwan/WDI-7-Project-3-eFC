# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  # Users
  tan_Ah_Kow = User.create(
  name: 'Tan Ah Kow',
  personal_id: 'S1234567A',
  email: 'footprintz1234@gmail.com',
  password: '12345678',
  contact_no: '12345678',
  )
  lee_Ah_Lian = User.create(
  name: 'Lee Ah Lian',
  personal_id: 'S1234567B',
  email: 'stephanietanlf@gmail.com',
  password: '12345678',
  contact_no: '12345678',
  )
  huat_Ah_Gu = User.create(
  name: 'Huat Ah Gu',
  personal_id: 'S1234567C',
  email: 'ahhhguuu@gmail.com',
  password: '12345678',
  contact_no: '12345678',
  )

  # Patients
  tan_Ah_Kow = Patient.create(
  name: 'Tan Ah Kow',
  age: 90,
  income: 0,
  medisave: 5000,
  user: [tan_Ah_Kow],
  )
  lee_Ah_Lian = Patient.create(
  name: 'Lee Ah Lian',
  age: 50,
  income: 150000,
  medisave: 60000,
  user: [lee_Ah_Lian],
  )
  huat_Ah_Gu = Patient.create(
  name: 'Huat Ah Gu',
  age: 30,
  income: 60000,
  medisave: 30000,
  user: [huat_Ah_Gu],
  )

  #patient_admissions
  admission_1 = PatientAdmission.create(
  treatment: 'test treatment',
  personal_id: 'S1234567A',
  length_of_stay: 2,
  start_treatment: DateTime.new(2016,2,16),
  end_treatment: DateTime.new(2016,2,17),
  doctor_in_charge: 'dr lim',
  ward_selected: 'C',
  bill_amount: 100,
  financial_counsel: true,
  claim_medisave: 0,
  pay_cash: 100,
  confirm: true,
  user: [tan_Ah_Kow],
  )
  admission_2 = PatientAdmission.create(
  treatment: 'test treatment',
  personal_id: 'S1234567B',
  length_of_stay: 3,
  start_treatment: DateTime.new(2016,2,16),
  end_treatment: DateTime.new(2016,2,18),
  doctor_in_charge: 'dr chee',
  ward_selected: 'A',
  bill_amount: 1000,
  financial_counsel: false,
  claim_medisave: 1000,
  pay_cash: 0,
  confirm: true,
  user: [lee_Ah_Lian],
  )
  admission_3 = PatientAdmission.create(
  treatment: 'test treatment',
  personal_id: 'S1234567C',
  length_of_stay: 7,
  start_treatment: DateTime.new(2016,2,16),
  end_treatment: DateTime.new(2016,2,22),
  doctor_in_charge: 'dr kays',
  ward_selected: 'B1',
  bill_amount: 700,
  financial_counsel: false,
  claim_medisave: 700,
  pay_cash: 0,
  confirm: true,
  user: [huat_Ah_Gu],
  )
  admission_4 = PatientAdmission.create(
  treatment: 'test treatment',
  personal_id: 'S1234567A',
  length_of_stay: 5,
  start_treatment: DateTime.new(2017,2,16),
  end_treatment: DateTime.new(2017,2,20),
  doctor_in_charge: 'dr lim',
  confirm: false,
  user: [tan_Ah_Kow]
  )
  admission_5 = PatientAdmission.create(
  treatment: 'test treatment',
  personal_id: 'S1234567B',
  length_of_stay: 9,
  start_treatment: DateTime.new(2017,2,16),
  end_treatment: DateTime.new(2017,2,24),
  doctor_in_charge: 'dr han',
  confirm: false,
  user: [lee_Ah_Lian]
  )
  admission_6 = PatientAdmission.create(
  treatment: 'test treatment',
  personal_id: 'S1234567C',
  length_of_stay: 2,
  start_treatment: DateTime.new(2017,2,16),
  end_treatment: DateTime.new(2017,2,17),
  doctor_in_charge: 'dr wong',
  confirm: false,
  user: [huat_Ah_Gu]
  )

  #wards
  ward_a = Ward.create(
  ward_type: 'A',
  availability: 50,
  cost_per_day: 428,
  )
  ward_b1 = Ward.create(
  ward_type: 'B1',
  availability: 20,
  cost_per_day: 75,
  )
  ward_b2 = Ward.create(
  ward_type: 'B2',
  availability: 10,
  cost_per_day: 60,
  )
  ward_c = Ward.create(
  ward_type: 'C',
  availability: 5,
  cost_per_day: 35,
  )
  puts 'Successfully added seed data'
end
