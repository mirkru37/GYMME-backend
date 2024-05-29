# frozen_string_literal: true

# Exercise model
class Exercise < ApplicationRecord
  include Uploader::Video::Attachment(:video)

  belongs_to :primary_muscle, class_name: 'Muscle'
  belongs_to :user, optional: true
  has_and_belongs_to_many :secondary_muscles,
                          class_name: 'Muscle', join_table: 'exercises_muscles'
  has_many :exercise_attachments, dependent: :destroy
  has_many :exercise_sets, dependent: :destroy
  accepts_nested_attributes_for :exercise_attachments, allow_destroy: true

  attribute :is_public, :boolean, default: false
  attribute :is_visible, :boolean, default: true

  scope :public_exercises, -> { visible.where(is_public: true) }
  scope :visible, -> { where(is_visible: true) }
end
