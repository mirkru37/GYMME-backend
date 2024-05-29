# frozen_string_literal: true

module Workouts
  module Contracts
    # Create
    class Create < ApplicationContract
      params do
        required(:duration).filled(:string)
        required(:exercise_sets_attributes) do
          array do
            hash do
              required(:exercise_id).filled(:string)
              required(:reps).filled(:integer)
              required(:weight).filled(:float)
            end
          end
        end
      end

      rule(:exercise_sets_attributes) do
        value.each do |attrs|
          key.failure('exercise_id must be a valid uuid') unless Exercise.exists?(attrs[:exercise_id])
          key.failure('reps must be greater than 0') if attrs[:reps] <= 0
          key.failure('weight must be greater than 0') if attrs[:weight] <= 0
        end
      end

      rule(:duration) do
        key.failure('duration must be a %H:%M:%S format') unless value.match?(/\A\d{2}:\d{2}:\d{2}\z/)
      end
    end
  end
end
