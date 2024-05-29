class CreateExerciseSets < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_sets, id: :uuid do |t|
      t.references :exercise, null: false, foreign_key: true, type: :uuid
      t.references :workout, null: false, foreign_key: true, type: :uuid
      t.integer :reps
      t.float :weight

      t.timestamps
    end
  end
end
