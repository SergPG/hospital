# frozen_string_literal: true

ActiveAdmin.register Admin do
  actions :all

  permit_params :user_id

  form do |f|
    f.inputs :user, for: [:user] do |d|
      d.input :phone_number
      d.input :first_name
      d.input :last_name
      d.input :password
    end
    f.actions
  end

  before_create do |admin|
    admin.user = User.create(
      params.require(:admin)
            .require(:user)
            .permit(:phone_number, :password, :first_name, :last_name)
    )
  end

  controller do
    def scoped_collection
      super.includes :user # prevents N+1 queries to your database
    end
  end
end
