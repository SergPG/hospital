class ProfilesController < ApplicationController    
  def show
    @model = current_profile.doctor? ? Doctor : User
    @appointments = @model.find_by(profile: current_profile).appointments
  end
end
  