class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  enum status: ['scheduled', 'completed']
end
