class CreateBlacklistTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :blacklist_tokens, id: false do |t|
      t.string :token, primary_key: true, null: false

      t.timestamps
    end
  end
end
