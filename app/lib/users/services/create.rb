# frozen_string_literal: true

module Users
  module Services
    # User creation service
    class Create
      include Interactor

      before do
        context.errors = []
      end

      def call
        validation = Users::Contracts::Registration.(context.params)
        if validation.success?
          context.user = User.create!(validation.to_h)
        else
          context.errors << validation.errors.to_h
          context.fail!
        end
      end
    end
  end
end
