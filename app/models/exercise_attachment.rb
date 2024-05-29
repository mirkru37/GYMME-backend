# frozen_string_literal: true

# Exercise Attachment model
class ExerciseAttachment < ApplicationRecord
  include Uploader::Image::Attachment(:attachment)
end
