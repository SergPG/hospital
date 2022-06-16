class Doctor < ApplicationRecord
  belongs_to :profile
  belongs_to :category
  has_many :appointments
end
