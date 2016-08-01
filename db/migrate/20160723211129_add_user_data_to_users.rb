class AddUserDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscription_end, :datetime
    add_column :users, :cancelled, :boolean, null: false, default: false
  end
end
