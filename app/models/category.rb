# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :doctors

  validates_uniqueness_of :name
end
