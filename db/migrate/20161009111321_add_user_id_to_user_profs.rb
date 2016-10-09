class AddUserIdToUserProfs < ActiveRecord::Migration[5.0]
  def change
    add_column :user_profs, :user_id, :integer
  end
end
