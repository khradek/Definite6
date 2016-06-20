class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :piece1
      t.integer :event_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :plays, :event_id
    add_index :plays, :user_id
  end
end
