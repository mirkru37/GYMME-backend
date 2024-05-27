# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates presence of password' do
      user = User.new
      expect(user.valid?).to be_falsey
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end
