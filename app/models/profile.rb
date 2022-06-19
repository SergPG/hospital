class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user
  has_one :doctor

  validates :phone_number, uniqueness: true

  def email_required?
   false
  end

  def email_changed?
   false
  end

  def doctor?
    doctor.present?
  end

  def user?
    user.present?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
