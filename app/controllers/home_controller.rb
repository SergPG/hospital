class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @doctors = Doctor.all.limit(3)
  end
end
