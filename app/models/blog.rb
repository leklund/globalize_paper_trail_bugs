class Blog < ActiveRecord::Base
  attr_accessible :title, :content
  has_paper_trail :ignore => [:access_count]
  translates :title, :content
end
