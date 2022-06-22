# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Appointment complete', type: :feature do
  include Warden::Test::Helpers

  let!(:appointment) { create :appointment, doctor: }
  let(:doctor) { create :doctor }
  let(:recommendation) { 'test' }

  before { login_as(doctor.user) }

  scenario 'successful complete' do
    visit appointment_path(appointment.id)
    expect(page).to have_text("Appointment for #{appointment.patient.full_name}")
    fill_in :recommendation, with: recommendation
    click_button 'Complete'
    expect(page).to have_text('Status: Completed')
    expect(page).to have_text("Recommendation: #{recommendation}")
  end
end
