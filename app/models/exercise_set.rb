# frozen_string_literal: true

# ExerciseSet model
class ExerciseSet < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
end
