class AddPracticeTagToEvents < ActiveRecord::Migration
  def change
    add_column :events, :practice_tag, :integer
    add_column :events, :installps_event_id, :integer
  end
end
