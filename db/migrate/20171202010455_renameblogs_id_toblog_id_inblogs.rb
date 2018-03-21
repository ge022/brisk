class RenameblogsIdToblogIdInblogs < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :blogs_id, :blog_id
  end
end
