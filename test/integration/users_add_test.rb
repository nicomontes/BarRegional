require 'test_helper'

class UsersAddTest < ActionDispatch::IntegrationTest
  test "invalid user add information" do
    get '/users/new'
    assert_no_difference 'User.count' do
      post users_path, params: {
        user: { 
          firstName:  "",
          lastName: "Doe",
          email: "user@invalid",
          initAmount: 32,
          password_digest: "test"
        } 
      }
    end
    assert_template 'users/new'
  end

  test "valid user add information" do
    get '/users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: {
        user: { 
          firstName:  "John",
          lastName: "Doe",
          email: "John.Doe@gmail.com",
          initAmount: 32,
          password_digest: "test"
        } 
      }
    end
    follow_redirect!
    assert_template 'users/index'
  end
end
