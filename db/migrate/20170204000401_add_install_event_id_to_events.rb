class AddInstallEventIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :install_event_id, :integer
  end
end
