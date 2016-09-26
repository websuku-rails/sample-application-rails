class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :url
      t.integer :price

      t.timestamps
    end
  end
end
