class CreateDefaultScript2s < ActiveRecord::Migration
  def change
    create_table :default_script2s do |t|
      t.integer :user_id
      t.text :us_data2
      t.text :us_format2
      t.text :us_class2
      t.string :title

      t.timestamps null: false
    end
  end
end
