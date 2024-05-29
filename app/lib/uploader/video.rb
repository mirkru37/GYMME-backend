# frozen_string_literal: true

module Uploader
  # Exercise Video uploader
  class Video < Shrine
    Attacher.validate do
      validate_size      1..(124.megabytes)
      validate_mime_type %w[video/mp4]
      validate_extension %w[mp4]
    end
  end
end
