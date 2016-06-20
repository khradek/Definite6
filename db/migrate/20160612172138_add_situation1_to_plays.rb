class AddSituation1ToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :situation1, :string
    add_column :plays, :situation2, :string
    add_column :plays, :situation3, :string
    add_column :plays, :situation4, :string
    add_column :plays, :situation5, :string
    add_column :plays, :situation6, :string
    add_column :plays, :situation7, :string
    add_column :plays, :situation8, :string
    add_column :plays, :situation9, :string
    add_column :plays, :situation10, :string
    add_column :plays, :type, :string
    add_column :plays, :hash_mark, :string
  end
end
