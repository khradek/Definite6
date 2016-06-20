class AddPiece2ToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :piece2, :string
  end
end
