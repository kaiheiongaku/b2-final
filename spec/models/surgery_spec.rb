require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'relationships' do
    it { should have_many(:doctors).through(:surgeries) }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :day_of_the_week }
    it {should validate_presence_of :room_number}
  end
end
