class Appointments::Create
    def initialize(user, params)
      @user = user
      @params = params
      @errors = []
    end
  
    def call
      validate_doctor_appointment_count
      return { errors: errors } unless errors.blank?
  
      create
    end
  
    private
  
    attr_accessor :user, :params, :errors
  
    def validate_doctor_appointment_count
      errors.push(doctor_id: 'can not be empty') if doctor.nil?
      errors.push(doctor_id: "already has #{Doctor::MAX_APPOINTMENTS} appointments") if doctor.appointments.scheduled.count == 10
    end

    def doctor
      @doctor ||= Doctor.find(params[:doctor_id])
    end
  
    def create
      appointment = user.appointments.new(params)
      if appointment.save
        appointment
      else
        appointment.errors.full_messages
      end
    end
  end