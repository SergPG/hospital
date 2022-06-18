class AppointmentsController < ApplicationController

    def index
        @appointments = Appointment.all
    end
    
    def show
        @appointment = "Appointment ID"
    end

    def new
        @appointment = Appointment.new

        @doctors = Doctor.all

        

    end

    def create
        
        
      

    @appointment = Appointment.new(appointment_params)
        
    # @appointment.doctor_id = params.require(:doctor_id)
    @appointment.user_id =  current_profile.user.id


    
     
      

        if @appointment.save
          redirect_to @appointment
        else
          render :new, status: :unprocessable_entity
        end


    end

    private
    def appointment_params
        
        
        # @appointment.doctor_id = params.require(:doctor_id)
    # @appointment.user_id =  current_profile.user.id
        
    # binding.pry

     result = params.require(:appointment).permit(
                :doctor_id,
                :date_at
                 )

    #  result.push(['user_id' => current_profile.user.id  ])  

    end 

   





end
