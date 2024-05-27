# frozen_string_literal: true

module Api
  module V1
    # Controller for receiving/refreshing refresh/access tokens
    class SessionsController < ApiController
      def create
        res = Sessions::Services::Create.(params: create_params)

        if res.failure?
          render_not_found
        else
          render json: res.result, status: :ok
        end
      end

      def refresh
        res = Sessions::Services::Refresh.(params: refresh_params)

        if res.failure?
          render_unauthorized
        else
          render json: res.result, status: :ok
        end
      end

      private

      def create_params
        params.permit(:auth_by, :identifier, :password)
      end

      def refresh_params
        params.permit(:refresh_token)
      end
    end
  end
end
