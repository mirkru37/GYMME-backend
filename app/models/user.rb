# frozen_string_literal: true

# User model
class User < ApplicationRecord
  has_secure_password

  has_many :exercises
  has_many :workouts

  attribute :confirmed, :boolean, default: false
end
