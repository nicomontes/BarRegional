require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end
  
  test "invalid user edit information" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    
    patch user_path(@user), params: {
      user: {
        firstName: name,
        lastName: @user.lastName,
        email: email,
        password_digest: @user.password_digest
      },
      admin_password: "sqkjfk",
      usr: {
        delete: "no"
      }
    }
    follow_redirect!
    @user.reload
    assert_not_equal name,  @user.firstName
    assert_not_equal email, @user.email
  end
  
  test "valid user edit information" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: {
      user: {
        firstName: name,
        lastName: @user.lastName,
        email: email,
        password_digest: @user.password_digest
      },
      admin_password: "azerty1234",
      usr: {
        delete: "no"
      }
    }
    assert_not flash.empty?
    assert_redirected_to users_path
    @user.reload
    assert_equal name,  @user.firstName
    assert_equal email, @user.email
  end
end
