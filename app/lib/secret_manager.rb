# frozen_string_literal: true

# singleton SecretManager class to fetch secrets from one place
class SecretManager
  include Singleton

  def self.secret(...)
    instance.secret(...)
  end

  def secret(path)
    JSON.parse(aws_client.get_secret_value(secret_id: path).secret_string).with_indifferent_access
  end

  private

  def aws_client
    Aws::SecretsManager::Client.new
  end
end
