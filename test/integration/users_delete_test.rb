require 'test_helper'

class UsersDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end
  
  test "invalid user delete information" do
    get edit_user_path(@user)
    assert_no_difference 'User.count' do
      patch user_path(@user.id.to_s), params: {
        user: {
          id: @user.id,
          firstName: @user.firstName.to_s,
          lastName: @user.lastName,
          email: @user.email,
          initAmount: @user.initAmount,
          password_digest: @user.password_digest
        },
        admin_password: ENV["ADMIN_PASSWORD"],
        usr: {
          delete: "no"
        }
      }
    end
    follow_redirect!
    assert_template 'users/index'
  end
  
  test "valid user delete information" do
    get edit_user_path(@user)
    assert_difference ['User.count', 'Operation.count'], -1 do
      patch user_path(@user.id.to_s), params: {
        user: {
          id: @user.id,
          firstName: @user.firstName.to_s,
          lastName: @user.lastName,
          email: @user.email,
          initAmount: @user.initAmount,
          password_digest: @user.password_digest
        },
        admin_password: ENV["ADMIN_PASSWORD"],
        usr: {
          delete: "yes"
        }
      }
    end
    follow_redirect!
    assert_template 'users/index'
  end
end
