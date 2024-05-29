# frozen_string_literal: true

module Workouts
  module Services
    # Create
    class Create
      include Interactor

      before do
        context.errors = []
      end

      def call # rubocop:disable Metrics/AbcSize
        validation = Workouts::Contracts::Create.(context.params)
        if validation.success?
          context.workout = context.user.workouts.create!(validation.to_h)
        else
          context.errors << validation.errors.to_h
          context.fail!
        end
      end
    end
  end
end
