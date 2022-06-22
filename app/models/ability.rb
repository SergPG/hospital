# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Doctor

    return unless user.present?

    can %i[read manage], User, id: user.id
    # can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"

    if user.patient?
      can :create, Appointment
      can :read, Appointment, patient: user.patient
    end

    if user.doctor?
      can :complete, Appointment, doctor: user.doctor
      can :read, Appointment, doctor: user.doctor
    end

    return unless user.admin?

    can [:manage], :all
    can :manage, ActiveAdmin::Page
  end
end
