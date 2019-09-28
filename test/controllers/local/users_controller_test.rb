require 'test_helper'

class Local::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get local_users_new_url
    assert_response :success
  end

  test "should get index" do
    get local_users_index_url
    assert_response :success
  end

  test "should get edit" do
    get local_users_edit_url
    assert_response :success
  end

  test "should get show" do
    get local_users_show_url
    assert_response :success
  end

end
