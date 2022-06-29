# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Appointment create', type: :feature do
  include Warden::Test::Helpers

  let!(:patient) { create :patient }
  let!(:doctor) { create :doctor }
  let!(:category) {create(:category, name: 'Therapist') }

  let!(:date_at) {date_at = Date.parse('2022-08-30') }
  
  before { login_as(patient.user) }

  scenario 'create new appointment' do
    visit new_appointment_path()

    expect(page).to have_text("New Appointment")
    select(category.name, from:'category_id' )
    select(doctor.full_name, from:'appointment_doctor_id' )

    select(date_at.mday.to_s, from:'appointment_date_at_3i' )
    select(Date::MONTHNAMES[date_at.month], from:'appointment_date_at_2i' )
    select(date_at.year.to_s, from:'appointment_date_at_1i')
   
    click_button 'Create Appointment'
    
    expect(page).to have_text("Appointment for #{patient.full_name}")
    expect(page).to have_text("Date: #{date_at} 00:00:00 UTC")
    expect(page).to have_text("With doctor: #{doctor.full_name}")
    #save_and_open_page
  end  
end  