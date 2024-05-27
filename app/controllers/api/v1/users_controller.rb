# frozen_string_literal: true

module Api
  module V1
    # Controller for user related actions
    class UsersController < ApiController
      def create
        res = Users::Services::Create.(params: user_params.to_h)
        if res.success?
          @user = res.user
        else
          render_bad_request(res.errors)
        end
      end

      private

      def user_params
        params.permit(:username, :email, :password)
      end
    end
  end
end
