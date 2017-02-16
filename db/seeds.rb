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
    user: []
  )
  lee_Ah_Lian = Patient.create(
    name: 'Lee Ah Lian',
    age: 50,
    income: 150000,
    medisave: 60000,
  )
  huat_Ah_Gu = Patient.create(
    name: 'Huat Ah Gu',
    age: 30,
    income: 60000,
    medisave: 30000,
  )

  #patient_admissions
  admission_1 = PatientAdmission.create(
    title: 'The Grand Budapest Hotel',
    summary: 'The adventures of Gustave H, a legendary concierge at a famous hotel from the fictional Republic of Zubrowka between the first and second World Wars, and Zero Moustafa, the lobby boy who becomes his most trusted friend.',
    youtube_embed_id: '1Fg5iWmQjwk',
    thumbnail: 'the_grand_budapest_hotel.jpg',
    actors: [ralph_fiennes, jeff_goldblum]
  )
  wish_i_was_here = Movie.create(
    title: 'Wish I was Here',
    summary: 'Aidan Bloom is a 35-year-old man who finds himself at major crossroads, which forces him to examine his life, his career, and his family.',
    youtube_embed_id: 'aCponfeWNOI',
    thumbnail: 'wish_i_was_here.jpg',
    actors: [zach_braff, kate_hudson]
  )
  a_night_at_the_roxbury = Movie.create(
    title: 'A Night at the Roxbury',
    summary: 'Two dim-witted brothers dream of owning their own dance club or at least getting into the coolest and most exclusive club in town, The Roxbury.',
    youtube_embed_id: 'Xvl3qJe9L9g',
    thumbnail: 'a_night_at_the_roxbury.jpg',
    actors: [will_ferrel, chris_kattan]
  )

  # Reviews
  Review.create(
    body: 'It has often been said that Wes Anderson walks the fine line between folly and genius. In the "Grand Budapest Hotel", however, this distinction no longer exists: the ridiculous becomes brilliant, and brilliant has never been this ridiculous.',
    user: brooks,
    movie: the_grand_budapest_hotel
  )
  Review.create(
    body: 'I for for one really enjoyed this movie. I saw it at a screening in Toronto. If you were a fan of Garden State you will love this movie. ',
    user: otto,
    movie: wish_i_was_here
  )
  Review.create(
    body: 'Emilioooooh!',
    user: luna,
    movie: a_night_at_the_roxbury
  )

  puts 'Successfully added seed data'
end
