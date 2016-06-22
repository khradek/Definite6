class AddPriorityToSavedPlays < ActiveRecord::Migration
  def change
    add_column :saved_plays, :priority, :integer
  end
end
