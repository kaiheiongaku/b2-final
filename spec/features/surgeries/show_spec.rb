require 'rails_helper'

RSpec.describe 'surgery show page' do
  before :each do
    @hospital = Hospital.create!(name: "Divine Hospital")

    @doctor = Doctor.create!(name: "Justin Forsyth", specialty: "gastroenterology", hospital_id: @hospital.id, graduated_from: "Harvard")
    @doctor2 = Doctor.create!(name: "House, MD", specialty: "dermatology", hospital_id: @hospital.id, graduated_from: "Yale")
    @doctor3 = Doctor.create!(name: "Sarah Heath", specialty: "ocular degeneration", hospital_id: @hospital.id, graduated_from: "Stanford")

    @appendectomy = Surgery.create!(title: 'appendectomy', day_of_the_week: "Monday", room_number: 10)
    @lobotomy = Surgery.create!(title: 'lobotomy', day_of_the_week: "Tuesday", room_number: 12)
    @wart = Surgery.create!(title: 'wart', day_of_the_week: 'Wednesday', room_number: 13)
    @cataracts = Surgery.create!(title: 'cataracts', day_of_the_week: 'Monday', room_number: 15)

    DoctorSurgery.create!(doctor: @doctor, surgery: @appendectomy)
    DoctorSurgery.create!(doctor: @doctor, surgery: @lobotomy)
    DoctorSurgery.create!(doctor: @doctor2, surgery: @wart)
    DoctorSurgery.create!(doctor: @doctor3, surgery: @cataracts)
    DoctorSurgery.create!(doctor: @doctor2, surgery: @appendectomy)
  end

  describe 'when I visit the show page' do
    it 'shows the title and operating room number' do
      visit "/surgeries/#{@appendectomy.id}"

      expect(page).to have_content(@appendectomy.title)
      expect(page).to have_content(@appendectomy.room_number)
    end

    it 'shows a section that includes other surgeries happening on the same day' do
      visit "/surgeries/#{@appendectomy.id}"

      within "#weekday" do
        expect(page).to have_content("Other surgeries happening this day of the week:")
        expect(page).to have_content(@cataracts.name)
      end
    end
  end
end
