class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.text :title
      t.text :content
      t.integer :pages
      t.text :author
      t.text :editor
      t.timestamp :published_at
      t.timestamps
    end
  end
  def down
    drop_table :books
  end
end
