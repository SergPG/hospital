class Doctor < ApplicationRecord
  MAX_APPOINTMENTS = 10

  belongs_to :user
  belongs_to :category
  has_many :appointments
  has_many :patients, through: :appointments

  delegate :first_name, :last_name, :full_name, to: :user
end
