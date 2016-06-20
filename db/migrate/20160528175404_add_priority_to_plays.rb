class AddPriorityToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :priority, :integer
  end
end
