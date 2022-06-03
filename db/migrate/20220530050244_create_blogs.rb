class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :blog_title,          null: false
      t.text   :blog_text,           null: false
      t.text   :blog_image
      t.references :user,            null: false, foreign_key: true
      t.references :category,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
