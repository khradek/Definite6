class AddPriorityToSavedFormations < ActiveRecord::Migration
  def change
    add_column :saved_formations, :priority, :integer
  end
end
