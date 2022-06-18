class ProfilesController < ApplicationController
    before_action :authenticate_profile!
    
    def show
        # @appointments = current_profile.user.appointments
    end
  end
  