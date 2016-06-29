class AddGamecallTagToEvents < ActiveRecord::Migration
  def change
    add_column :events, :gamecall_tag, :integer
  end
end
