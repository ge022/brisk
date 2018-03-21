class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :author
      t.text :content
      t.datetime :published_date

      t.timestamps
    end
  end
end
