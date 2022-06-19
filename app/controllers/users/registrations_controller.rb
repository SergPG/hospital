# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      Patient.create(user: user) if user.persisted?
    end
  end
end
