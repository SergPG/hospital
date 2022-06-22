# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @model = current_user.doctor? ? Doctor : Patient
    @appointments = @model.find_by(user: current_user).appointments
  end
end
