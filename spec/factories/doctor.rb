# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    association :user
    association :category
  end
end
