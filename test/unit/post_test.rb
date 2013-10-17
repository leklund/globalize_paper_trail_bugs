require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'post title' do
    create_post
    post = Post.last
    assert_equal 'aaa', post.title
  end
  test "title attribute should save" do
    create_post
    post = Post.last
    post.title = 'bbb'
    post.save
    assert_equal 'bbb', post.title
  end

  test 'access_count should increment' do
    create_post
    post = Post.last
    post.increment!(:access_count)
    assert_equal 1, post.access_count
  end

  test 'access_count increment should create version' do
    create_post
    post = Post.last
    v = post.versions.size
    post.increment!(:access_count)
    assert_equal v+1, post.versions.size
  end

  # test "the truth" do
  #   assert true
  # end
end
