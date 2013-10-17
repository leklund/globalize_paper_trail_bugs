class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.integer :access_count
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
