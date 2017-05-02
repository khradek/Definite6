class AddOrigColWidthsToScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :orig_col_widths, :text
    add_column :practice_schedules, :orig_col_widths, :text
  end
end
