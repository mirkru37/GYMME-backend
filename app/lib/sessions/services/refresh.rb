# frozen_string_literal: true

module Sessions
  module Services
    # Create session service
    class Refresh
      include Interactor

      def call
        return unauthorized unless validate_refresh_token

        refresh_token = JwtAuthClient.refresh_token(context.user)
        access_token = JwtAuthClient.access_token(context.user)

        context.result = { refresh_token:, access_token: }
      end

      private

      def unauthorized
        Rails.logger.error(message: 'Unauthorized', refresh_token: context.params[:refresh_token])
        context.fail!(error: 'Unauthorized')
      end

      def validate_refresh_token
        payload = JwtAuthClient.validate_refresh_token(context.params[:refresh_token])
        return false unless payload

        context.user = User.find_by(id: payload['user_id'])
        BlacklistToken.create!(token: context.params[:refresh_token])
      end
    end
  end
end
