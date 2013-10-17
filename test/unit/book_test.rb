require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'book title should save' do
    create_book
    book = Book.last
    book.title = 'a new title'
    book.save
    assert_equal 'a new title', book.title
  end
end
