require 'test_helper'

class KegsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drink = drinks(:one)
    @keg = kegs(:one)
  end

  test "should get index" do
    get kegs_url
    assert_response :success
    assert_select "title", "BarCVVR Fûts"
  end

  test "should get show" do
    get keg_path(@keg)
    assert_response :success
    assert_select "title", "BarCVVR Fût "+@keg.id.to_s
  end

  test "should get new" do
    get "/kegs/new"
    assert_response :success
    assert_select "title", "BarCVVR Nouveau Fût"
  end

  test "should get edit" do
    get edit_keg_path(@keg)
    assert_response :success
    assert_select "title", "BarCVVR Edition du Fût "+@keg.id.to_s
  end
end
