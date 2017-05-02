class AddColWidthsToDefaultScript < ActiveRecord::Migration
  def change
    add_column :default_scripts, :col_widths, :text
    add_column :default_script2s, :col_widths, :text
    add_column :default_script3s, :col_widths, :text
    add_column :default_practices, :col_widths, :text
    add_column :scripts, :col_widths, :text
    add_column :practice_schedules, :col_widths, :text
  end
end
