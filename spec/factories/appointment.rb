# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    association :patient
    association :doctor
    date_at { DateTime.current }
  end
end
