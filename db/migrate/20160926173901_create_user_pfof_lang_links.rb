class CreateUserPfofLangLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_pfof_lang_links do |t|
      t.integer :User_id
      t.integer :lang_id

      t.timestamps
    end
  end
end
