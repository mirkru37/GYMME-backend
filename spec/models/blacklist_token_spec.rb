# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BlacklistToken, type: :model do
  describe 'validations' do
    it 'validates presence of token' do
      blacklist_token = BlacklistToken.new
      expect(blacklist_token.valid?).to be_falsey
      expect(blacklist_token.errors[:token]).to include("can't be blank")
    end
  end
end
