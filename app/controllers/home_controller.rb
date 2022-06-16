class HomeController < ApplicationController
  def index
    
  end
  before_action :authenticate_profile!
end
