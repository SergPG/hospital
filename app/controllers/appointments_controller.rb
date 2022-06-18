class AppointmentsController < ApplicationController

    def index
      @appointments = Appointment.all
    end
    
    def show
        appointment
    end

    def new
      @appointment = Appointment.new
      @doctors = Doctor.all
    end

    def create
        @appointment = current_profile.user.appointments.new(appointment_new_params)
        if @appointment.save
          redirect_to @appointment
        else
          render :new, status: :unprocessable_entity
        end
    end

    def complete
        result = Appointments::Complete.new(appointment, appointment_complete_params).call
  
        if result[:errors].blank?
          redirect_to result
        else
          render :show, status: :unprocessable_entity
        end
    end
  
      private
  
      def appointment
        @appointment ||= Appointment.find(params[:id])
      end
  
      def appointment_new_params
          params.require(:appointment).permit(:doctor_id, :date_at)
      end
  
      def appointment_complete_params
        params.require(:appointment).permit(:recommendation)
      end

end
