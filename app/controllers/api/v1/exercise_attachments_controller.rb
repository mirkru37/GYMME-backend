# frozen_string_literal: true

module Api
  module V1
    # Attachments controller
    class ExerciseAttachmentsController < ApiController
      before_action :authorize_user
      before_action :set_exercise

      def create # rubocop:disable Metrics/AbcSize
        unless params[:video] || params[:attachments]
          return render_bad_request({ error: 'attachments should be present' })
        end

        @exercise.video = (params[:video]) if params[:video]
        @exercise.update(exercise_attachments_attributes:) if params[:attachments].present?

        render_bad_request(@exercise.errors.to_hash) unless @exercise.save
      end

      def index; end

      def destroy
        if @exercise.exercise_attachments.find_by(id: params[:id])&.destroy
          head :no_content
        elsif @exercise.video&.id&.split('.')&.first == params[:id]
          @exercise.update(video: nil)
          head :no_content
        else
          render_not_found
        end
      end

      private

      def set_exercise
        @exercise = @current_user.exercises.find(params[:exercise_id])
      end

      def exercise_attachments_params
        params.permit(:video, attachments: {})
      end

      def exercise_attachments_attributes
        exercise_attachments_params[:attachments].to_h.map do |_, attachment|
          { attachment: }
        end
      end
    end
  end
end
