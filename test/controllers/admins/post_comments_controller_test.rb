require "test_helper"

class Admins::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_post_comments_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_post_comments_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_post_comments_destroy_url
    assert_response :success
  end
end
