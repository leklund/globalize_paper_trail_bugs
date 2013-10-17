class Book < ActiveRecord::Base
  attr_accessible :title, :content, :author, :editor
  has_paper_trail
end
