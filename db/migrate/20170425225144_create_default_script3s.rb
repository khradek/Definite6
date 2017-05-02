class CreateDefaultScript3s < ActiveRecord::Migration
  def change
    create_table :default_script3s do |t|
      t.integer :user_id
      t.text :us_data3
      t.text :us_format3
      t.text :us_class3
      t.string :title

      t.timestamps null: false
    end
  end
end
