class AddSituation2ToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :situation1, :boolean, null: false, default: false
    add_column :plays, :situation2, :boolean, null: false, default: false
    add_column :plays, :situation3, :boolean, null: false, default: false
    add_column :plays, :situation4, :boolean, null: false, default: false
    add_column :plays, :situation5, :boolean, null: false, default: false
    add_column :plays, :situation6, :boolean, null: false, default: false
    add_column :plays, :situation7, :boolean, null: false, default: false
    add_column :plays, :situation8, :boolean, null: false, default: false
    add_column :plays, :situation9, :boolean, null: false, default: false
    add_column :plays, :situation10, :boolean, null: false, default: false
    add_column :plays, :situation11, :boolean, null: false, default: false
    add_column :plays, :situation12, :boolean, null: false, default: false
    add_column :plays, :situation13, :boolean, null: false, default: false
    add_column :plays, :situation14, :boolean, null: false, default: false
  end
end
