require 'test_helper'

class FavouriteProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get favourite_projects_new_url
    assert_response :success
  end

  test "should get create" do
    get favourite_projects_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favourite_projects_destroy_url
    assert_response :success
  end

end
