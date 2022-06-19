class Doctor < ApplicationRecord
  MAX_APPOINTMENTS = 10

  belongs_to :profile
  belongs_to :category
  has_many :appointments
  has_many :users, through: :appointments

  delegate :first_name, :last_name, :full_name, to: :profile
end
