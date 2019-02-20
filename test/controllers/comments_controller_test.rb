require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @comment = comments(:one)
    @user = users(:two)
    sign_in(@user)
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end


  test "should create comment" do
    assert_difference('Comment.count') do
      post post_comments_url(@comment.post), params: { comment: { content: @comment.content, post_id: @comment.post_id } }
    end

    assert_redirected_to post_url(@comment.post)
  end


  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { content: @comment.content, post_id: @comment.post_id } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    sign_out(@user)
    sign_in(users(:one))
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end

  test "should not destroy comment" do
    assert_difference('Comment.count', 0) do
      delete comment_url(@comment)
    end
  end
end
