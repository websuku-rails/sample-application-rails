class CreateEventLangLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :event_lang_links do |t|
      t.integer :event_id
      t.integer :lang_id

      t.timestamps
    end
  end
end
