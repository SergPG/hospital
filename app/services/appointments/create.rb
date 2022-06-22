# frozen_string_literal: true

module Appointments
  class Create
    def initialize(patient, params)
      @patient = patient
      @params = params
      @errors = []
    end

    def call
      validate_doctor_appointment_count
      return { errors: } unless errors.blank?

      create
    end

    private

    attr_accessor :patient, :params, :errors

    def validate_doctor_appointment_count
      errors.push(doctor_id: 'can not be empty') if doctor.nil?
      return unless doctor.appointments.scheduled.count >= 10

      errors.push(doctor_id: "already has #{Doctor::MAX_APPOINTMENTS} appointments")
    end

    def doctor
      @doctor ||= Doctor.find(params[:doctor_id])
    end

    def create
      appointment = patient.appointments.new(params)
      if appointment.save
        appointment
      else
        appointment.errors.full_messages
      end
    end
  end
end
