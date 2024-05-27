# frozen_string_literal: true

module Sessions
  module Services
    # Create session service
    class Create
      include Interactor

      EMAIL_AUTH = 'email'
      USERNAME_AUTH = 'username'

      def call
        user = find_user(params[:auth_by], params[:identifier])

        return not_found unless user

        return not_found unless authenticate(user, params[:password])

        refresh_token = JwtAuthClient.refresh_token(user)
        access_token = JwtAuthClient.access_token(user)

        context.result = { refresh_token:, access_token: }
      end

      private

      def params
        context.params
      end

      def find_user(auth_by, identifier)
        if auth_by == EMAIL_AUTH
          User.find_by(email: identifier)
        elsif auth_by == USERNAME_AUTH
          User.find_by(username: identifier)
        end
      end

      def authenticate(user, password)
        user.authenticate(password)
      end

      def not_found
        Rails.logger.error(message: 'User not found', identifier: params[:identifier], auth_by: params[:auth_by])
        context.fail!(error: 'User not found')
      end
    end
  end
end
