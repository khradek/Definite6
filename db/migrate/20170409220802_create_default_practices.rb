class CreateDefaultPractices < ActiveRecord::Migration
  def change
    create_table :default_practices do |t|
      t.text :up_data
      t.text :up_format
      t.text :up_class
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
