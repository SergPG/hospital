# frozen_string_literal: true

class HomeController < ApplicationController
  skip_load_and_authorize_resource
  skip_before_action :authenticate_user!

  def index
    @doctors = Doctor.all.limit(3)
  end
end
