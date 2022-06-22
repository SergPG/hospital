# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'POST #create' do
    let!(:patient) { create :patient }
    let(:doctor) { create :doctor }
    let(:params) do
      {
        appointment: {
          data_at: DateTime.current,
          doctor_id: doctor.id
        }
      }
    end

    before do
      sign_in(patient.user)
      allow(controller).to receive_messages(current_user: patient.user)
    end

    it 'saves the new appointment in the database' do
      expect { post :create, params: }.to change(Appointment, :count).by(1)
    end

    context 'when doctor has 10 appointments' do
      before do
        create_list(:appointment, 10, doctor:)
      end

      it 'does not save the new appointment in the database' do
        post :create, params: params
        expect(Appointment.count).to eq(10)
      end

      it 'returns 422 status' do
        post :create, params: params
        expect(response).to have_http_status(422)
      end
    end
  end
end
