class Appointments::Create
    def initialize(patient, params)
      @patient = patient
      @params = params
      @errors = []
    end
  
    def call
      validate_doctor_appointment_count
      return { errors: errors } unless errors.blank?
  
      create
    end
  
    private
  
    attr_accessor :patient, :params, :errors
  
    def validate_doctor_appointment_count
      errors.push(doctor_id: 'can not be empty') if doctor.nil?
      errors.push(doctor_id: "already has #{Doctor::MAX_APPOINTMENTS} appointments") if doctor.appointments.scheduled.count == 10
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