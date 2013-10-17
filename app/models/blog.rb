class Blog < ActiveRecord::Base
  attr_accessible :title, :content, :author, :editor
  has_paper_trail :ignore => [:access_count]
  translates :title, :content
end
