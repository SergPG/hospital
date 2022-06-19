class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  enum status: ['scheduled', 'completed']
end
