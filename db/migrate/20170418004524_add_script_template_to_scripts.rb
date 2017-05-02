class AddScriptTemplateToScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :script_template, :string
  end
end
