class CreateBlogs < ActiveRecord::Migration
  def up
    create_table :blogs do |t|
      t.text :title
      t.text :content
      t.integer :access_count
      t.text :author
      t.text :editor
      t.timestamp :published_at
      t.timestamps
    end
    Blog.create_translation_table! :title => :text, :content => :text
  end
  def down
    drop_table :blogs
    Blog.drop_translation_table!
  end
end
