class Admin < ApplicationRecord
    belongs_to :user
  
    delegate :first_name, :last_name, :full_name, to: :user
  end
  