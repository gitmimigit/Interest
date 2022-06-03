class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.string :favorite_name,       null: false
      t.text   :favorite_profile,    null: false
      t.text   :favorite_image,      null: false
      t.references :user,            null: false, foreign_key: true
      t.references :category,        null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorites, [:favorite_name, :user_id ], unique: true
  end
end
