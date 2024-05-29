# frozen_string_literal: true

# Muscle model
class Muscle < ApplicationRecord
  has_many :primary_exercises, class_name: 'Exercise', foreign_key: 'primary_muscle_id'
  has_and_belongs_to_many :exercises, join_table: 'exercises_muscles'
end
