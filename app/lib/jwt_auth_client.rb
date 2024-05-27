# frozen_string_literal: true

# Client for user authentication via JWT token
class JwtAuthClient
  REFRESH_TOKEN_EXPIRATION = 1.week

  class << self
    def access_token(user)
      JwtToken.encode({ user_id: user.id })
    end

    def validate_access_token(token)
      payload = JwtToken.decode(token)&.first

      return unless validate_user(payload&.[]('user_id')) && validate_token(token)

      payload
    end

    def refresh_token(user)
      JwtToken.encode({ user_id: user.id },
                      secret_base: refresh_token_secret_base, exp: REFRESH_TOKEN_EXPIRATION.from_now.to_i)
    end

    def validate_refresh_token(token)
      payload = JwtToken.decode(token, secret_base: refresh_token_secret_base)&.first

      return unless validate_user(payload&.[]('user_id')) && validate_token(token)

      payload
    end

    private

    def validate_user(user_id)
      return false unless user_id

      User.find_by(id: user_id).presence
    end

    def validate_token(token)
      !BlacklistToken.exists?(token)
    end

    def refresh_token_secret_base
      SecretManager.secret(Settings.jwt_secret_storage)[:refresh_token_base].to_s
    end
  end
end
