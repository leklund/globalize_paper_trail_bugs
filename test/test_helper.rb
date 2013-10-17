ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  #
  def create_blog
    Blog.create(:title => 'blog', :content => 'log', :author => 'zaphod', :editor => 'ford')
  end
  def create_post
    Post.create(:title => 'aaa', :content => 'zzz', :author => 'zaphod', :editor => 'ford')
  end
   def create_book
    Book.create(:title => 'book', :content => 'words', :author => 'zaphod', :editor => 'ford')
  end
end
