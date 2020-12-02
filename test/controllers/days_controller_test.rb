require 'test_helper'

class DaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get days_index_url
    assert_response :success
  end

  test "should get show" do
    get days_show_url
    assert_response :success
  end

  test "should get create" do
    get days_create_url
    assert_response :success
  end

  test "should get update" do
    get days_update_url
    assert_response :success
  end

  test "should get destroy" do
    get days_destroy_url
    assert_response :success
  end

end
