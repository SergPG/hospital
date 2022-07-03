# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointments::Create, type: :class do

  describe '#call'  do
      subject { described_class.new(patient, params).call } 
      
      let!(:patient) { create :patient }
      let!(:doctor) { create :doctor }
      let!(:params) do
        {
          doctor_id: doctor.id,
          date_at: DateTime.new(2022, 1, 1)
        }
      end

      it do
       # binding.pry
       # subject
       #  binding.pry
        # expect(Appointment.first).to have_attributes(patient: patient, doctor: doctor, date_at: params[:date_at])
        # expect(subject).to have_attributes(patient_id: patient.id) 
        is_expected.to have_attributes(patient_id: patient.id) 
        # binding.pry
      end

      context 'when doctor has 10 appointments' do
        
        before do
          create_list(:appointment, 10, doctor:)
        end

        it 'check that count of appointsment do not change' do 
          subject
          expect(Appointment.count).to eq(10)
        end
     
        # let(:errors) {subject[:errors]}
          it "what service return - (errors)" do
            expect(subject[:errors]).to include(doctor_id: "already has 10 appointments")     
          #  binding.pry
        end  
      end  
  end
end