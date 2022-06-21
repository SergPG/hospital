class HomeController < ApplicationController
  skip_load_and_authorize_resource
  
  def index
    @doctors = Doctor.all.limit(3)
  end
end
