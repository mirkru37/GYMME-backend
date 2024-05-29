# frozen_string_literal: true

module Exercises
  module Services
    # Exercise creation service
    class Create
      include Interactor

      before do
        context.errors = []
      end

      def call # rubocop:disable Metrics/AbcSize
        validation = Exercises::Contracts::Create.(context.params)
        if validation.success?
          context.exercise = Exercise.create!(**validation.to_h, user: context.user)
        else
          context.errors << validation.errors.to_h
          context.fail!
        end
      end
    end
  end
end
