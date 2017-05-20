class AddGamecallTemplateToGamecalls < ActiveRecord::Migration
  def change
    add_column :gamecalls, :gamecall_template, :string
    add_column :gamecalls, :col_widths1, :text
    add_column :gamecalls, :col_widths2, :text
    add_column :gamecalls, :orig_col_widths1, :text
    add_column :gamecalls, :orig_col_widths2, :text
    add_column :gamecalls, :g_format1, :text
    add_column :gamecalls, :g_format2, :text
    add_column :gamecalls, :g_class1, :text
    add_column :gamecalls, :g_class2, :text
  end
end
