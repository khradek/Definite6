class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :title
      t.text :sdata
      t.integer :event_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :scripts, :event_id
    add_index :scripts, :user_id
  end
end
