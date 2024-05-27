# frozen_string_literal: true

module Api
  module V1
    # Base class for all API controllers
    class ApiController < ActionController::API
      before_action :authenticate_api_key

      private

      def authenticate_api_key
        api_key = request.headers['X-Api-Key']
        tenant = SecretManager.secret(Settings.api_keys.secret_storage_name).select { |_, v| v == api_key }
        return if tenant.present?

        render_not_found
        Rails.logger.warn(message: 'Undefined api-key call', api_key: api_key)
      end

      def render_not_found
        render json: { error: 'Not Found' }, status: :not_found
      end

      def render_bad_request(errors)
        render json: { errors: }, status: :bad_request
      end

      def render_unauthorized
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  end
end
