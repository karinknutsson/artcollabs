require 'test_helper'

class CollabsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get collabs_new_url
    assert_response :success
  end

  test "should get create" do
    get collabs_create_url
    assert_response :success
  end

  test "should get edit" do
    get collabs_edit_url
    assert_response :success
  end

  test "should get update" do
    get collabs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get collabs_destroy_url
    assert_response :success
  end

end
