class AddStartTimeToScript < ActiveRecord::Migration
  def change
    add_column :scripts, :start_time, :datetime
     add_column :scripts, :end_time, :datetime
  end
end
