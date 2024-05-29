# frozen_string_literal: true

module Exercises
  module Contracts
    # Contract for creating new exercise
    class Create < ApplicationContract
      NAME_MAX_LENGTH = 30
      INSTRUCTIONS_MAX_LENGTH = 3000

      params do
        required(:name).filled(:string)
        required(:instructions).filled(:string)
        required(:primary_muscle_id).filled(:string)
        optional(:secondary_muscle_ids).maybe(:array)
      end

      rule(:name) do
        key.failure('must be less than 30 characters') if value.length > NAME_MAX_LENGTH
      end

      rule(:instructions) do
        key.failure('must be less than 2000 characters') if value.length > INSTRUCTIONS_MAX_LENGTH
      end

      rule(:primary_muscle_id) do
        key.failure('must exist') unless Muscle.exists?(id: value)
      end

      rule(:secondary_muscle_ids) do
        value&.each do |id|
          key.failure("non existent muscle #{id}") unless Muscle.exists?(id:)
        end
      end
    end
  end
end
