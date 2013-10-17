class Post < ActiveRecord::Base
  attr_accessible :title, :content, :author, :editor
  translates :title, :content

  has_paper_trail
end
