class AddPositionToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :position, :integer
  end
end
