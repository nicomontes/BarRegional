require 'test_helper'

class KegsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @keg = kegs(:one)
  end

  test "should get index" do
    get kegs_url
    assert_response :success
  end

  test "should get new" do
    get new_keg_url
    assert_response :success
  end

  test "should create keg" do
    assert_difference('Keg.count') do
      post kegs_url, params: { keg: { capacity: @keg.capacity, drink_id: @keg.drink_id, endDate: @keg.endDate, name: @keg.name, price: @keg.price, startDate: @keg.startDate } }
    end

    assert_redirected_to keg_url(Keg.last)
  end

  test "should show keg" do
    get keg_url(@keg)
    assert_response :success
  end

  test "should get edit" do
    get edit_keg_url(@keg)
    assert_response :success
  end

  test "should update keg" do
    patch keg_url(@keg), params: { keg: { capacity: @keg.capacity, drink_id: @keg.drink_id, endDate: @keg.endDate, name: @keg.name, price: @keg.price, startDate: @keg.startDate } }
    assert_redirected_to keg_url(@keg)
  end

  test "should destroy keg" do
    assert_difference('Keg.count', -1) do
      delete keg_url(@keg)
    end

    assert_redirected_to kegs_url
  end
end
