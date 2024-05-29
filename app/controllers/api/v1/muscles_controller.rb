# frozen_string_literal: true

module Api
  module V1
    # Muscles controller
    class MusclesController < ApiController
      before_action :authorize_user

      def index
        @muscles = Muscle.all
      end
    end
  end
end
