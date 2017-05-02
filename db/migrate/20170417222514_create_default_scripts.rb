class CreateDefaultScripts < ActiveRecord::Migration
  def change
    create_table :default_scripts do |t|
      t.integer :user_id
      t.text :us_data
      t.text :us_format
      t.text :us_class

      t.timestamps null: false
    end
  end
end
