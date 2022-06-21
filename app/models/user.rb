class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :patient
  has_one :doctor
  has_one :admin

  validates :phone_number,
    presence: true,
    uniqueness: { case_sensitive: false },
    numericality: true,
    length: { minimum: 10, maximum: 15 }


  def email_required?
   false
  end

  def email_changed?
   false
  end

  def doctor?
    doctor.present?
  end

  def patient?
    patient.present?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def will_save_change_to_email?
    false
  end

  def admin?
    admin.present?
  end
end
