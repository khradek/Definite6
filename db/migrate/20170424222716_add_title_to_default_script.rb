class AddTitleToDefaultScript < ActiveRecord::Migration
  def change
    add_column :default_scripts, :title, :string
  end
end
