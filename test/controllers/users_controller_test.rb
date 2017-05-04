require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
    assert_select "title", "BarCVVR"
  end
  
  test "should get show" do
    get user_path(@user)
    assert_response :success
    assert_select "title", "BarCVVR Utilisateur "+@user.firstName
  end
  
  test "should get new" do
    get "/users/new"
    assert_response :success
    assert_select "title", "BarCVVR Nouvel Utilisateur"
  end
  
  test "should get edit" do
    get edit_user_path(@user)
    assert_response :success
    assert_select "title", "BarCVVR Edition de "+@user.firstName
  end
end
