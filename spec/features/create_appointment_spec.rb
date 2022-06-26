# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Appointment create', type: :feature do
  include Warden::Test::Helpers

  let!(:patient) { create :patient }
  let!(:doctor) { create :doctor }

  before { login_as(patient.user) }

  scenario 'create new appointment' do
  
  end  
end  