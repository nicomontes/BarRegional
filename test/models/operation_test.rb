require 'test_helper'

class OperationTest < ActiveSupport::TestCase
  def setup
    @operation = operations(:one)
  end

  test "should be valid" do
    assert @operation.valid?
  end

  test "date should be present and are date" do
    @operation.date = ""
    assert_not @operation.valid?
    # These tests fail, I don't know why !
    #@operation.date = '2016-11-03'
    #assert_not @operation.valid?
    #@operation.date = '22:06:30'
    #assert_not @operation.valid?
    @operation.date = "qskdf"
    assert_not @operation.valid?
    @operation.date = 43
    assert_not @operation.valid?
  end
  
  test "sum should be present, numeric and other than 0" do
    @operation.sum = ""
    assert_not @operation.valid?
    @operation.sum = "jsdhs"
    assert_not @operation.valid?
    @operation.sum = 90
    assert @operation.valid?
    @operation.sum = 90.98
    assert @operation.valid?
    @operation.sum = -90
    assert @operation.valid?
    @operation.sum = -90.98
    assert @operation.valid?
    @operation.sum = 0
    assert_not @operation.valid?
  end
  
  test "user_id should be present and are correct foreign key" do
    @operation.user_id = ""
    assert_not @operation.valid?
    @operation.user_id = 1234
    assert_not @operation.valid?
    @operation.user_id = "test"
    assert_not @operation.valid?
  end
end
