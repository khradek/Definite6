class CreatePracticeSchedules < ActiveRecord::Migration
  def change
    create_table :practice_schedules do |t|
      t.string :title
      t.integer :event_id
      t.integer :user_id
      t.datetime :start_time
      t.text :p_data
      t.text :p_format
      t.text :p_class

      t.timestamps null: false
    end
    add_index :practice_schedules, :user_id
    add_index :practice_schedules, :event_id
  end
end
