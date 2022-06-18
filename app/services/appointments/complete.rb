class Appointments::Complete
  def initialize(appointment, params)
    @appointment = appointment
    @params = params
    @errors = []
  end

  def call
    validate_object
    return { errors: errors } unless errors.blank?

    complete
  end

  private

  attr_accessor :appointment, :params, :errors

  def validate_object
    errors.push(status: 'can not complete from this status') if appointment.completed?
    errors.push(date_at: 'date_at greater than current date') if appointment.date_at > DateTime.current
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
