class CreateSavedPlays < ActiveRecord::Migration
  def change
    create_table :saved_plays do |t|
      t.string :title
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
