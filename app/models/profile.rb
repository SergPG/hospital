class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users
  has_many :doctors

  validates :phone_number, uniqueness: true

def email_required?
 false
end

def email_changed?
 false
end

end
