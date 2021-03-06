# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def index
    @model = current_user.doctor? ? Doctor : Patient
    @appointments = @model.find_by(user: current_user)
                          .appointments
                          .order(status: :asc, date_at: :asc, id: :asc)
  end

  def show; end

  def new
    @appointment = Appointment.new(params.permit(:doctor_id))
    @categories = Category.all
    @doctors = category.present? ? Doctor.by_category(category.id) : Doctor.all
  end

  def create
    result = Appointments::Create.new(current_user.patient, create_params).call

    if result[:errors].blank?
      redirect_to result
    else
      redirect_to new_appointment_path, status: :unprocessable_entity
      # flash[:message] = "Missing Fields"
    end
  end

  def complete
    result = Appointments::Complete.new(@appointment, appointment_complete_params).call

    if result[:errors].blank?
      redirect_to result
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  # def appointment
  #   @appointment ||= Appointment.find(params[:id])
  # end

  def create_params
    params.require(:appointment).permit(:doctor_id, :date_at)
  end

  def appointment_complete_params
    params.require(:appointment).permit(:recommendation)
  end

  def category
    @category ||= Category.find_by(id: params[:category_id])
  end
end
