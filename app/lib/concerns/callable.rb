# frozen_string_literal: true

# Make class as callable without initialization
module Callable
  extend ActiveSupport::Concern

  class_methods do
    def call(...)
      new.(...)
    end
  end
end
