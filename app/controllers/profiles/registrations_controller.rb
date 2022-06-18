# frozen_string_literal: true

class Profiles::RegistrationsController < Devise::RegistrationsController
  def create
    super do |profile|
      User.create(profile: profile) if profile.persisted?
    end
  end
end
