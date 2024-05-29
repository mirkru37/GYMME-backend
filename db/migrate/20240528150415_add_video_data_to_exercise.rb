class AddVideoDataToExercise < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :video_data, :jsonb
  end
end
