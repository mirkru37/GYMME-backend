# frozen_string_literal: true

# model for storing blacklisted tokens
class BlacklistToken < ApplicationRecord
  self.primary_key = 'token'
end
