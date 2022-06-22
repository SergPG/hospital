# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      super do |user|
        Patient.create(user:) if user.persisted?
      end
    end
  end
end
