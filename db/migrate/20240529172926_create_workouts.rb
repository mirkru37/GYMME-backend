class CreateWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :workouts, id: :uuid do |t|
      t.time :duration
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
