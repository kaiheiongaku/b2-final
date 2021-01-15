# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Hospital.destroy_all
Doctor.destroy_all
Surgery.destroy_all
DoctorSurgery.destroy_all

hospital = Hospital.create!(name: "Divine Hospital")

doctor = Doctor.create!(name: "Justin Forsyth", specialty: "gastroenterology", hospital_id: hospital.id)
doctor2 = Doctor.create!(name: "House, MD", specialty: "dermatology", hospital_id: hospital.id)
doctor3 = Doctor.create!(name: "Sarah Heath", specialty: "ocular degeneration", hospital_id: hospital.id)

appendectomy = Surgery.create!(Title: 'ppendectomy', day_of_the_week: "Monday", room_number: 10)
lobotomy = Surgery.create!(Title: 'lobotomy', day_of_the_week: "Tuesday", room_number: 12)
wart = Surgery.create!(Title: 'wart', day_of_the_week: 'Wednesday', room_number: 13)
cataracts = Surgery.create!(Title: 'cataracts', day_of_the_week: 'Thursday', room_number: 15)

DoctorSurgery.create!(doctor: doctor, surgery: appendectomy)
DoctorSurgery.create!(doctor: doctor, surgery: lobotomy)
DoctorSurgery.create!(doctor: doctor2, surgery: wart)
DoctorSurgery.create!(doctor: doctor3, surgery: cataracts)
DoctorSurgery.create!(doctor: doctor2, surgery: appendectomy)
