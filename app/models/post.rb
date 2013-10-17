class Post < ActiveRecord::Base
  attr_accessible :title, :content
  translates :title, :content

  has_paper_trail
end
