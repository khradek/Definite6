class RemoveSituation1FromPlays < ActiveRecord::Migration
  def change
    remove_column :plays, :situation1, :string
    remove_column :plays, :situation2, :string
    remove_column :plays, :situation3, :string
    remove_column :plays, :situation4, :string
    remove_column :plays, :situation5, :string
    remove_column :plays, :situation6, :string
    remove_column :plays, :situation7, :string
    remove_column :plays, :situation8, :string
    remove_column :plays, :situation9, :string
    remove_column :plays, :situation10, :string
  end
end
