# frozen_string_literal: true

module Users
  module Contracts
    # Contract for registering new user
    class Registration < ApplicationContract
      EMAIL_REGEX = /^((?!\.)[\w\-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$/i
      PASSWORD_MAX_LENGTH = 30
      PASSWORD_MIN_LENGTH = 8
      USERNAME_MAX_LENGTH = 20
      USERNAME_MIN_LENGTH = 3
      EMAIL_MAX_LENGTH = 255

      params do
        required(:username).filled(:string)
        required(:email).filled(:string)
        required(:password).filled(:string)
      end

      rule(:email) do
        key.failure('invalid email format') unless value.match?(EMAIL_REGEX)
        key.failure('must be less than 255 characters') if value.length > EMAIL_MAX_LENGTH
        key.failure('must be unique') if User.exists?(email: value)
      end

      rule(:username) do
        key.failure('must be at least 3 characters') if value.length < USERNAME_MIN_LENGTH
        key.failure('must be less than 20 characters') if value.length > USERNAME_MAX_LENGTH
        key.failure('must contain only characters, numbers, underscore') unless value.match?(/^[\w\d]+$/)
        key.failure('must be unique') if User.exists?(username: value)
      end

      rule(:password) do
        key.failure('must be at least 8 characters') if value.length < PASSWORD_MIN_LENGTH
        key.failure('must be less than 30 characters') if value.length > PASSWORD_MAX_LENGTH
        key.failure('must contain at least one number') unless value.match?(/\d/)
        key.failure('must contain at least one uppercase letter') unless value.match?(/[A-Z]/)
        key.failure('must contain at least one lowercase letter') unless value.match?(/[a-z]/)
        key.failure('must contain one of special characters(!@#$%^&*?)') unless value.match?(/[!@#$%^&*?]/)
        key.failure('invalid password format') if value.match?(/[^\w\d!@#$%^&*?]+/)
      end
    end
  end
end
