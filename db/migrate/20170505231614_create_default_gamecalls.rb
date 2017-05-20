class CreateDefaultGamecalls < ActiveRecord::Migration
  def change
    create_table :default_gamecalls do |t|
      t.string :title
      t.integer :user_id
      t.text :gc_data1
      t.text :gc_format1
      t.text :gc_class1
      t.text :gc_data2
      t.text :gc_format2
      t.text :gc_class2
      t.text :col_widths1
      t.text :col_widths2
      t.timestamps null: false      
    end
  end
end
