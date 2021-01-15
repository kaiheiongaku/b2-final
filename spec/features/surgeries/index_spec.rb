require 'rails_helper'

RSpec.describe 'surgery index page' do
  before :each do
    @hospital = Hospital.create!(name: "Divine Hospital")

    @doctor = Doctor.create!(name: "Justin Forsyth", specialty: "gastroenterology", hospital_id: @hospital.id, graduated_from: "Harvard")
    @doctor2 = Doctor.create!(name: "House, MD", specialty: "dermatology", hospital_id: @hospital.id, graduated_from: "Yale")
    @doctor3 = Doctor.create!(name: "Sarah Heath", specialty: "ocular degeneration", hospital_id: @hospital.id, graduated_from: "Stanford")

    @appendectomy = Surgery.create!(title: 'appendectomy', day_of_the_week: "Monday", room_number: 10)
    @lobotomy = Surgery.create!(title: 'lobotomy', day_of_the_week: "Tuesday", room_number: 12)
    @wart = Surgery.create!(title: 'wart', day_of_the_week: 'Wednesday', room_number: 13)
    @cataracts = Surgery.create!(title: 'cataracts', day_of_the_week: 'Thursday', room_number: 15)

    DoctorSurgery.create!(doctor: @doctor, surgery: @appendectomy)
    DoctorSurgery.create!(doctor: @doctor, surgery: @lobotomy)
    DoctorSurgery.create!(doctor: @doctor2, surgery: @wart)
    DoctorSurgery.create!(doctor: @doctor3, surgery: @cataracts)
    DoctorSurgery.create!(doctor: @doctor2, surgery: @appendectomy)
  end

  describe 'when I visit the index page' do
    it 'shows the titles and doctors of all surgeries' do
      visit '/surgeries'

      expect(current_path).to eq("/surgeries")

      within "#surgery-#{@appendectomy.id}" do
        expect(page).to have_content(@appendectomy.title)
        expect(page).to have_content(@doctor.name)
        expect(page).to have_content(@doctor2.name)
      end

      within "#surgery-#{@lobotomy.id}" do
        expect(page).to have_content(@lobotomy.title)
        expect(page).to have_content(@doctor.name)
      end

      within "#surgery-#{@wart.id}" do
        expect(page).to have_content(@wart.title)
        expect(page).to have_content(@doctor2.name)
      end

      within "#surgery-#{@cataracts.id}" do
        expect(page).to have_content(@cataracts.title)
        expect(page).to have_content(@doctor3.name)
      end
    end

    it 'will allow me to click a link to a surgery show page' do
      visit '/surgeries'

      click_link "#{@cataracts.title}"
    end

    it 'will take me to the surgery show page' do
      visit '/surgeries'

      click_link "#{@cataracts.title}"

      expect(current_path).to eq("/surgeries/#{@cataracts.id}")
    end
  end

end
