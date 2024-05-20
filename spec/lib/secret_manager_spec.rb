# frozen_string_literal: true

require 'rails_helper'

describe SecretManager do
  let(:aws_client) { instance_double(Aws::SecretsManager::Client) }
  let(:aws_response) do
    instance_double(Aws::SecretsManager::Types::GetSecretValueResponse, secret_string: returned_secrets.to_json)
  end
  let(:returned_secrets) { { 'key' => 'value' } }

  before do
    allow(Aws::SecretsManager::Client).to receive(:new).and_return(aws_client)
    allow(aws_client).to receive(:get_secret_value).with(secret_id: path).and_return(aws_response)
  end

  describe '.secret' do
    subject { SecretManager.secret(path) }

    let(:path) { 'path' }

    it { is_expected.to eq(returned_secrets) }
  end

  describe '#secret' do
    subject { SecretManager.instance.secret(path) }

    let(:path) { 'path' }

    it { is_expected.to eq(returned_secrets) }
  end
end
