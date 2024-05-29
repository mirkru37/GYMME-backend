# frozen_string_literal: true

module Api
  module V1
    # ExerciseSetsController
    class ExerciseSetsController < ApiController
      before_action :authorize_user

      def index
        @exercise_sets = ExerciseSet.includes([:exercise]).joins(:workout)
                                    .where(workouts: { user_id: @current_user.id })
        @exercise_sets = @exercise_sets.where(workout_id: params[:workout_id]) if params[:workout_id]
        @exercise_sets = @exercise_sets.where(exercise_id: params[:exercise_id]) if params[:exercise_id]
      end
    end
  end
end
