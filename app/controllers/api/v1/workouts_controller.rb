# frozen_string_literal: true

module Api
  module V1
    # WorkoutsController
    class WorkoutsController < ApiController
      before_action :authorize_user

      def create
        res = Workouts::Services::Create.(params: workout_params.to_h, user: @current_user)
        if res.success?
          @workout = res.workout
        else
          render_bad_request(res.errors)
        end
      end

      def index
        @workouts = @current_user.workouts
      end

      def show
        @workout = @current_user.workouts.find(params[:id])
      end

      def destroy
        @workout = @current_user.workouts.find(params[:id])
        @workout.destroy
      end

      private

      def workout_params
        params[:workout].permit(:duration, exercise_sets_attributes: %i[exercise_id reps weight])
      end
    end
  end
end
