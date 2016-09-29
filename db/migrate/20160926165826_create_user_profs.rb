class CreateUserProfs < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profs do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.integer :skillLevel
      t.string :introduction

      t.timestamps
    end
  end
end
