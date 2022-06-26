# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Appointment create', type: :feature do
  include Warden::Test::Helpers

  let!(:patient) { create :patient }
  let!(:doctor) { create :doctor }
  let!(:category) {create(:category, name: 'Therapist') }

  before { login_as(patient.user) }

  scenario 'create new appointment' do
    visit new_appointment_path()

    expect(page).to have_text("New Appointment")
    # select('Therapist', from:'Therapist' )
  
  end  
end  