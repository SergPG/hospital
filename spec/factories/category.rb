# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  sequence :name do |_n|
    Faker::Lorem.word
  end

  factory :category do
    name
  end
end
