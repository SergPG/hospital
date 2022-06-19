ActiveAdmin.register Doctor do

  actions :all

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :profile_id, :category_id
  #
  # or
  #
  form do |f|
    f.inputs do
      f.input :category
    end
    f.inputs :profile, for: [:profile] do |d|
      d.input :phone_number
      d.input :first_name
      d.input :last_name
      d.input :password
    end
    f.actions
  end

  permit_params do
    [:profile, :category_id]
  end

  before_create do |doctor|
    doctor.profile = Profile.create(params.require(:doctor)
                                          .require(:profile)
                                          .permit(:phone_number, :password, :first_name, :last_name)
                                    )
  end

  controller do
    def scoped_collection
      super.includes :profile # prevents N+1 queries to your database
    end
  end

  # index do
  #   selectable_column
  #   column "Name", :first_name
  #   column :category
  #   column :created_at
  #   column :updated_at
  #   actions
  # end
  
end
