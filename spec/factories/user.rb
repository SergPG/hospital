require 'faker'

FactoryBot.define do
  sequence :phone_number do |_n|
    Faker::Base.numerify('##########')
  end

  factory :user do
    phone_number
    password { 'password' }
    password_confirmation { 'password' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
