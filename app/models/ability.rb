# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.patient?
      can :create, Appointment
    end
  end
end
