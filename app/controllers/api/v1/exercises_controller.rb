# frozen_string_literal: true

module Api
  module V1
    # Exercises controller
    class ExercisesController < ApiController
      before_action :authorize_user

      def index
        @exercises = if params[:public] == 'true'
                       Exercise.public_exercises
                     else
                       @current_user.exercises.visible
                     end.includes(:primary_muscle, :secondary_muscles)
        filter_exercises
        @meta = { total: @exercises.count }
        offset_limit
      end

      def create
        res = Exercises::Services::Create.(params: exercise_params.to_h, user: @current_user)
        if res.success?
          @exercise = res.exercise
        else
          render_bad_request(res.errors)
        end
      end

      def update
        res = Exercises::Services::Update.(params: exercise_params.to_h,
                                           exercise: @current_user.exercises.find(params[:id]))
        if res.success?
          @exercise = res.exercise
        else
          render_bad_request(res.errors)
        end
      end

      def show
        @exercise = Exercise.visible.find(params[:id])
        render_not_found unless @exercise.is_public || @exercise.user_id == @current_user.id
      end

      def destroy
        @current_user.exercises.find(params[:id]).destroy
      end

      private

      def filter_exercises
        return unless params[:filter_primary_muscles] && params[:filter_secondary_muscles]

        primary_ids = params[:filter_primary_muscles]&.split(',')
        secondary_ids = params[:filter_secondary_muscles]&.split(',')
        @exercises = @exercises.where(primary_muscle_id: primary_ids)
                               .or(@exercises.where(secondary_muscles: { id: secondary_ids }))
      end

      def offset_limit
        @exercises = @exercises
                     .limit(params[:limit])
                     .offset(params[:offset])
      end

      def exercise_params
        params.permit(:name, :primary_muscle_id, :instructions, secondary_muscle_ids: [])
      end
    end
  end
end
