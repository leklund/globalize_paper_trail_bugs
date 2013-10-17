class Book < ActiveRecord::Base
  attr_accessible :title, :content
  has_paper_trail
end
