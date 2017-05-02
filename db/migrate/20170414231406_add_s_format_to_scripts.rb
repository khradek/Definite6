class AddSFormatToScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :s_format, :text
    add_column :scripts, :s_class, :text
  end
end
