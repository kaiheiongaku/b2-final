require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'relationships' do
    it { should have_many(:doctors).through(:doctor_surgeries) }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :day_of_the_week }
    it {should validate_presence_of :room_number}
  end

  describe 'instance methods' do
    it 'can find all surgeries happening on a day' do
      @hospital = Hospital.create!(name: "Divine Hospital")

      @doctor = Doctor.create!(name: "Justin Forsyth", specialty: "gastroenterology", hospital_id: @hospital.id, graduated_from: "Harvard")
      @doctor2 = Doctor.create!(name: "House, MD", specialty: "dermatology", hospital_id: @hospital.id, graduated_from: "Yale")
      @doctor3 = Doctor.create!(name: "Sarah Heath", specialty: "ocular degeneration", hospital_id: @hospital.id, graduated_from: "Stanford")

      @appendectomy = Surgery.create!(title: 'appendectomy', day_of_the_week: "Monday", room_number: 10)
      @lobotomy = Surgery.create!(title: 'lobotomy', day_of_the_week: "Tuesday", room_number: 12)
      @wart = Surgery.create!(title: 'wart', day_of_the_week: 'Wednesday', room_number: 13)
      @cataracts = Surgery.create!(title: 'cataracts', day_of_the_week: "Monday", room_number: 15)

      DoctorSurgery.create!(doctor: @doctor, surgery: @appendectomy)
      DoctorSurgery.create!(doctor: @doctor, surgery: @lobotomy)
      DoctorSurgery.create!(doctor: @doctor2, surgery: @wart)
      DoctorSurgery.create!(doctor: @doctor3, surgery: @cataracts)
      DoctorSurgery.create!(doctor: @doctor2, surgery: @appendectomy)

      expect(@appendectomy.same_day_surgeries).to eq([@appendectomy, @cataracts])
    end
  end
end
