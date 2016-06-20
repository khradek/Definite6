class AddPeriod1ToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :period1, :boolean, null: false, default: false
    add_column :plays, :period2, :boolean, null: false, default: false
    add_column :plays, :period3, :boolean, null: false, default: false
    add_column :plays, :period4, :boolean, null: false, default: false
  end
end
