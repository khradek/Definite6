class AddInstallgcEventIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :installgc_event_id, :integer
  end
end
