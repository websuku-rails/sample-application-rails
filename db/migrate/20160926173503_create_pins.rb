class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.integer :User_id
      t.integer :event_id

      t.timestamps
    end
  end
end
