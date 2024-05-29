# frozen_string_literal: true

# Workout model
class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercise_sets, dependent: :destroy
  accepts_nested_attributes_for :exercise_sets

  def formated_duration
    Time.at(duration).utc.strftime('%H:%M:%S')
  end
end
