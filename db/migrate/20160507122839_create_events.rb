class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :event_type
      t.integer :script_tag

      t.timestamps null: false
    end
    add_index :events, :user_id
  end
end
