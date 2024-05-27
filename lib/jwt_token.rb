# frozen_string_literal: true

# JWT Token service
class JwtToken
  DEFAULT_EXPIRATION = 5.minutes
  DEFAULT_ALGORITHM = 'HS256'

  class << self
    def encode(payload, secret_base: nil, exp: DEFAULT_EXPIRATION.from_now.to_i)
      secret_base ||= default_secret_base
      payload[:exp] = exp
      JWT.encode(payload, secret_base, DEFAULT_ALGORITHM)
    end

    def decode(token, secret_base: nil)
      secret_base ||= default_secret_base
      JWT.decode(token, secret_base, true, algorithm: DEFAULT_ALGORITHM)
    rescue JWT::DecodeError => e
      Rails.logger.error(
        message: 'JWT Token decode error',
        context: e.message,
        token:
      )
      nil
    end

    private

    def default_secret_base
      SecretManager.secret(Settings.jwt_secret_storage)[:jwt_token_base].to_s
    end
  end
end
