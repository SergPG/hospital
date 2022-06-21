# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, Doctor

    return unless user.present?

    can [:read, :manage], User, id: user.id

    if user.patient?
      can :create, Appointment
      can :read, Appointment, patient: user.patient 
    end

    if user.doctor?
      can :complete, Appointment
      can :read, Appointment, doctor: user.doctor
    end

    return unless user.admin?
    can [:manage], :all
    can :manage, ActiveAdmin::Page
  end
end
