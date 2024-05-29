class CreateExerciseAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_attachments, id: :uuid do |t|
      t.references :exercise, foreign_key: true, type: :uuid
      t.jsonb :attachment_data

      t.timestamps
    end
  end
end
