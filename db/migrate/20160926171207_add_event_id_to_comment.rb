class AddEventIdToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :event_id, :integer
  end
end
