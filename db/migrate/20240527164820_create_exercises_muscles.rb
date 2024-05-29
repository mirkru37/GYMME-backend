class CreateExercisesMuscles < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises_muscles, id: false do |t|
      t.belongs_to :exercise, type: :uuid
      t.belongs_to :muscle, type: :uuid

      t.timestamps
    end
  end
end
