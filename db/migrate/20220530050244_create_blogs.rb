class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :blog_title,          null: false
      t.string :blog_text,           null: false
      t.references :user,            null: false, foreign_key: true
      t.references :category,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
