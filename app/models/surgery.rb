class Surgery < ApplicationRecord
  validates_presence_of :title, :day_of_the_week, :room_number

  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries
end
