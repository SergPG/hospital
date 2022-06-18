class AppointmentsController < ApplicationController

    def index
        @appointments = Appointment.all
    end
    
    def show
        @appointment = Appointment.find(params[:id])
    end

    def new
        @appointment = Appointment.new
        @doctors = Doctor.all
    end

    def create     
    # @appointment = сurrent_profile.user.appointments.new(appointment_params)

    @appointment = Appointment.new(appointment_params)
    @appointment.user_id =  current_profile.user.id

        if @appointment.save
          redirect_to @appointment
        else
          render :new, status: :unprocessable_entity
        end
    end

    private
    def appointment_params 
    # binding.pry
        params.require(:appointment).permit(
                :doctor_id,
                :date_at )
    end 

end
