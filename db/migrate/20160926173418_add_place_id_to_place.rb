class AddPlaceIdToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :place_id, :integer
  end
end
