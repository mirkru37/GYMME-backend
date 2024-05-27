class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username, index: { unique: true }, null: false
      t.string :email, index: { unique: true }, null: false
      t.string :password_digest
      t.boolean :confirmed

      t.timestamps
    end
  end
end
