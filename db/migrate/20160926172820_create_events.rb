class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :date
      t.integer :star
      t.string :body
      t.string :title
      t.integer :event_id

      t.timestamps
    end
  end
end
