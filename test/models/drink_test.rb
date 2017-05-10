require 'test_helper'

class DrinkTest < ActiveSupport::TestCase
  def setup
    @drink = drinks(:one)
  end

  test "should be valid" do
    assert @drink.valid?
  end

  test "name should be present" do
    @drink.name = ""
    assert_not @drink.valid?
  end
  
  test "drink_type should be present" do
    @drink.drink_type = ""
    assert_not @drink.valid?
  end
  
  test "price should be present and positiv numeric" do
    @drink.price = ""
    assert_not @drink.valid?
    @drink.price = "jsdhs"
    assert_not @drink.valid?
    @drink.price = 90
    assert @drink.valid?
    @drink.price = 90.98
    assert @drink.valid?
    @drink.price = -90
    assert_not @drink.valid?
    @drink.price = -90.98
    assert_not @drink.valid?
  end

end
