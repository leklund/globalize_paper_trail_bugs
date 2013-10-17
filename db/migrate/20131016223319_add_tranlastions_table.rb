class AddTranlastionsTable < ActiveRecord::Migration
  def up
    Post.create_translation_table! :title => :text, :content => :text
  end

  def down
    Post.drop_translation_table!
  end
end
