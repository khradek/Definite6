class CreateGamecalls < ActiveRecord::Migration
  def change
    create_table :gamecalls do |t|
      t.string :title
      t.text :gdata
      t.integer :event_id
      t.integer :user_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
