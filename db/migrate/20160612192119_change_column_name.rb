class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :plays, :type, :play_type
  end
end
