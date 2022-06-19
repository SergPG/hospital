# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(profile)
    if profile.user?
      can :create, Appointment
    end
  end
end
