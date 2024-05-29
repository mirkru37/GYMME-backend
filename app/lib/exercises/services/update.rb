# frozen_string_literal: true

module Exercises
  module Services
    # Exercise creation service
    class Update
      include Interactor

      before do
        context.errors = []
      end

      def call
        validation = Exercises::Contracts::Update.(context.params)
        if validation.success?
          context.exercise.update!(**validation.to_h)
        else
          context.errors << validation.errors.to_h
          context.fail!
        end
      end
    end
  end
end
