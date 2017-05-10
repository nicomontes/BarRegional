require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "firstName should be present" do
    @user.firstName = ""
    assert_not @user.valid?
  end
  
  test "lastName should be present and are string" do
    @user.lastName = ""
    assert_not @user.valid?
  end
  
  test "initAmount should be present and numeric" do
    @user.initAmount = ""
    assert_not @user.valid?
    @user.initAmount = "jsdhs"
    assert_not @user.valid?
    @user.initAmount = 90
    assert @user.valid?
    @user.initAmount = 90.98
    assert @user.valid?
    @user.initAmount = -90
    assert @user.valid?
    @user.initAmount = -90.98
    assert @user.valid?
  end
  
  test "amount should be present and numeric" do
    @user.amount = ""
    assert_not @user.valid?
    @user.amount = "qjkshd"
    assert_not @user.valid?
    @user.amount = 90
    assert @user.valid?
    @user.amount = 90.98
    assert @user.valid?
    @user.amount = -90
    assert @user.valid?
    @user.amount = -90.98
    assert @user.valid?
  end
  
  test "email should be present and are email" do
    @user.email = ""
    assert_not @user.valid?
    @user.email = "qsjdkf"
    assert_not @user.valid?
    @user.email = 98
    assert_not @user.valid?
    @user.email = -87
    assert_not @user.valid?
    @user.email = "john.doe+glider@gmail.com"
    assert @user.valid?
  end
end
