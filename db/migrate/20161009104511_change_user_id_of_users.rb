class ChangeUserIdOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :user_id, :integer
  end
end
