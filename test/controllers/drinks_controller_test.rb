require 'test_helper'

class DrinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drink = drinks(:one)
  end

  test "should get index" do
    get drinks_url
    assert_response :success
    assert_select "title", "BarCVVR Boissons"
  end

  test "should get show" do
    get drink_path(@drink)
    assert_response :success
    assert_select "title", "BarCVVR Boisson "+@drink.id.to_s
  end

  test "should get new" do
    get "/drinks/new"
    assert_response :success
    assert_select "title", "BarCVVR Nouvelle Boisson"
  end

  test "should get edit" do
    get edit_drink_path(@drink)
    assert_response :success
    assert_select "title", "BarCVVR Edition de la Boisson "+@drink.id.to_s
  end
end
