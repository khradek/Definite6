class AddGdata2ToGamecalls < ActiveRecord::Migration
  def change
    add_column :gamecalls, :gdata2, :text
  end
end
