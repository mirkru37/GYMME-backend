class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises, id: :uuid do |t|
      t.boolean :is_public
      t.boolean :is_visible, default: true
      t.string :name
      t.text :instructions
      t.belongs_to :primary_muscle, type: :uuid

      t.timestamps
    end
  end
end
