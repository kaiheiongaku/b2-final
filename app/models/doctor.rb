class Doctor < ApplicationRecord
  validates_presence_of :name, :specialty, :graduated_from
  belongs_to :hospital
  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries
end
