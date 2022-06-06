class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.string :memo_title,          null: false
      t.text   :memo_text,           null: false
      t.text   :memo_image
      t.references :user,            null: false, foreign_key: true
      t.references :favorite,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
