#create user

users = User.create!([
{
  name: 'Lee Ah Lian',
  personal_id: 'S1234567B',
  email: 'stephanietanlf@gmail.com',
  password: '12345678',
  contact_no: '12345678'
},
{
  name: 'Huat Ah Gu',
  personal_id: 'S1234567C',
  email: 'ahhhguuu@gmail.com',
  password: '12345678',
  contact_no: '12345678'
},
{
  name: 'Tan Ah Kow',
  personal_id: 'S1234567A',
  email: 'footprintz1234@gmail.com',
  password: '12345678',
  contact_no: '12345678'
}
])

patients = Patient.create!([
{
  name: 'Lee Ah Lian',
  age: 90,
  personal_id: 'S1234567B',
  income: 150000,
  medisave: 45000,
  user_id: users[0].id
},
{
  name: 'Huat Ah Gu',
  age: 90,
  personal_id: 'S1234567C',
  income: 10000,
  medisave: 5000,
  user_id: users[1].id
},
{
  name: 'Tan Ah Kow',
  age: 50,
  personal_id: 'S1234567C',
  income: 55000,
  medisave: 8000,
  user_id: users[2].id
}
])

patient_admissions = PatientAdmission.create!([
{
  treatment: 'test treatment',
  personal_id: 'S1234567B',
  length_of_stay: 2,
  start_treatment: DateTime.new(2016,02,16),
  end_treatment: DateTime.new(2016,02,17),
  doctor_in_charge: 'Dr Lim',
  financial_counsel: true,
  confirm: true,
  claim_medisave: 100,
  pay_cash: 1000,
  user_id: users[0].id
},
{
  treatment: 'test treatment',
  personal_id: 'S1234567A',
  length_of_stay: 7,
  start_treatment: DateTime.new(2016,02,16),
  end_treatment: DateTime.new(2016,02,22),
  doctor_in_charge: 'Dr Wong',
  financial_counsel: true,
  confirm: true,
  claim_medisave: 500,
  pay_cash: 3000,
  user_id: users[2].id
},
{
  treatment: 'test treatment',
  personal_id: 'S1234567C',
  length_of_stay: 5,
  start_treatment: DateTime.new(2016,02,16),
  end_treatment: DateTime.new(2016,02,20),
  doctor_in_charge: 'Dr Chee',
  financial_counsel: true,
  confirm: true,
  claim_medisave: 900,
  pay_cash: 6000,
  user_id: users[1].id
},
{
  treatment: 'test treatment',
  personal_id: 'S1234567B',
  length_of_stay: 3,
  start_treatment: DateTime.new(2017,02,16),
  end_treatment: DateTime.new(2017,02,18),
  doctor_in_charge: 'Dr Neo',
  user_id: users[0].id
},
{
  treatment: 'test treatment',
  personal_id: 'S1234567A',
  length_of_stay: 6,
  start_treatment: DateTime.new(2017,02,16),
  end_treatment: DateTime.new(2017,02,21),
  doctor_in_charge: 'Dr Hans',
  user_id: users[2].id
},
{
  treatment: 'test treatment',
  personal_id: 'S1234567C',
  length_of_stay: 8,
  start_treatment: DateTime.new(2017,02,16),
  end_treatment: DateTime.new(2017,02,22),
  doctor_in_charge: 'Dr Boey',
  user_id: users[1].id
}
])
