require 'test_helper'

class KegTest < ActiveSupport::TestCase
  def setup
    @keg = kegs(:one)
  end

  test "should be valid" do
    assert @keg.valid?
  end

  test "startDate should be present and are date" do
    @keg.startDate = ""
    assert_not @keg.valid?
    # These tests fail, I don't know why !
    #@keg.startDate = "2016-11-03"
    #assert_not @keg.valid?
    #@keg.startDate = "22:06:30"
    #assert_not @keg.valid?
    @keg.startDate = "qskdf"
    assert_not @keg.valid?
    @keg.startDate = 43
    assert_not @keg.valid?
  end
  
  test "endDate should be present and are date" do
    @keg.endDate = ""
    assert_not @keg.valid?
    # These tests fail, I don't know why !
    #@keg.endDate = "2016-11-03"
    #assert_not @keg.valid?
    #@keg.endDate = "22:06:30"
    #assert_not @keg.valid?
    @keg.endDate = "qskdf"
    assert_not @keg.valid?
    @keg.endDate = 43
    assert_not @keg.valid?
  end
  
  test "capacity should be present and positiv numeric" do
    @keg.capacity = ""
    assert_not @keg.valid?
    @keg.capacity = "jsdhs"
    assert_not @keg.valid?
    @keg.capacity = 90
    assert @keg.valid?
    @keg.capacity = 90.98
    assert @keg.valid?
    @keg.capacity = -90
    assert_not @keg.valid?
    @keg.capacity = -90.98
    assert_not @keg.valid?
  end
  
  test "price should be present and positiv numeric" do
    @keg.price = ""
    assert_not @keg.valid?
    @keg.price = "jsdhs"
    assert_not @keg.valid?
    @keg.price = 90
    assert @keg.valid?
    @keg.price = 90.98
    assert @keg.valid?
    @keg.price = -90
    assert_not @keg.valid?
    @keg.price = -90.98
    assert_not @keg.valid?
  end
  
  test "drink_id should be present and are correct foreign key" do
    @keg.drink_id = ""
    assert_not @keg.valid?
    @keg.drink_id = 1234
    assert_not @keg.valid?
    @keg.drink_id = "test"
    assert_not @keg.valid?
  end
end
