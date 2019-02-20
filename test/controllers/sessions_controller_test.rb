require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "admins should redirect to comments_url" do
    sign_in(users(:one))
    post user_session_url
    assert_redirected_to comments_url
  end

  test "No admins should redirect to home" do
    sign_in(users(:two))
    post user_session_url
    assert_redirected_to root_url
  end
end
