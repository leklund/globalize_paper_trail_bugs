require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  test 'blog title attribute should save' do
    create_blog
    blog = Blog.last
    blog.title = 'zoot'
    blog.save
    assert_equal 'zoot', blog.title
  end
  test 'access_count should increment' do
    create_blog
    blog = Blog.last
    blog.increment!(:access_count)
    assert_equal 1, blog.access_count
  end

  test 'access_count increment should NOT create version' do
    create_blog
    blog = Blog.last
    v = blog.versions.size
    blog.increment!(:access_count)
    assert_equal v, blog.versions.size
  end

end
