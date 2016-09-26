class AddJoinPermitToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :join_permit, :boolean
  end
end
