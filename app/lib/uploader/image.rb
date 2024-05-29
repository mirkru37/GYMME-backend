# frozen_string_literal: true

module Uploader
  # Exercise Image uploader
  class Image < Shrine
    Attacher.validate do
      validate_size      1..(124.megabytes)
      validate_mime_type %w[image/jpeg image/png image/webp image/heic]
      validate_extension %w[jpg jpeg png webp heic]
    end
  end
end
