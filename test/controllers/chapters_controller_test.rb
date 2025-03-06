require "test_helper"

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chapters_index_url
    assert_response :success
  end

  test "should get show" do
    get chapters_show_url
    assert_response :success
  end

  test "should get new" do
    get chapters_new_url
    assert_response :success
  end

  test "should get create" do
    get chapters_create_url
    assert_response :success
  end
end
