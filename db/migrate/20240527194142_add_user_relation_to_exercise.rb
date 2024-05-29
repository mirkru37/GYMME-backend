class AddUserRelationToExercise < ActiveRecord::Migration[7.1]
  def change
    change_table :exercises do |t|
      t.belongs_to :user, type: :uuid, null: true
    end
  end
end
