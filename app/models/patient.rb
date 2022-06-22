# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :doctors, through: :appointments

  delegate :first_name, :last_name, :full_name, to: :user
end
