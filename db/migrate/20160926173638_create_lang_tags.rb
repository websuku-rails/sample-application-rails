class CreateLangTags < ActiveRecord::Migration[5.0]
  def change
    create_table :lang_tags do |t|
      t.string :lang
      t.integer :lang_id

      t.timestamps
    end
  end
end
