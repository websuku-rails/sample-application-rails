class CreateJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :joins do |t|
      t.integer :User_id
      t.integer :event_id

      t.timestamps
    end
  end
end
