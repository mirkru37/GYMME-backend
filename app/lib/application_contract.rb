# frozen_string_literal: true

# Base contract for all contracts
class ApplicationContract < Dry::Validation::Contract
  include Callable
end
