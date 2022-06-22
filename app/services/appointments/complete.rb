# frozen_string_literal: true

module Appointments
  class Complete
    def initialize(appointment, params)
      @appointment = appointment
      @params = params
      @errors = []
    end

    def call
      validate_object
      return { errors: } unless errors.blank?

      complete
    end

    private

    attr_accessor :appointment, :params, :errors

    def validate_object
      errors.push(status: 'can not complete from this status') if appointment.completed?
      errors.push(recommendation: 'can not be blank') if appointment_params[:recommendation].blank?
    end

    def complete
      if appointment.update(appointment_params)
        appointment
      else
        appointment.errors.full_messages
      end
    end

    def appointment_params
      params.merge(status: 'completed')
    end
  end
end
