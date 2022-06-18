class User < ApplicationRecord
  belongs_to :profile
  has_many :appointments
  has_many :doctors, through: :appointments

  delegate :first_name, :last_name, to: :profile
end
