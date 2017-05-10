require 'test_helper'

class OperationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operation = operations(:one)
  end

  test "should get index" do
    get operations_url
    assert_response :success
    assert_select "title", "BarCVVR Opérations"
  end

  test "should get show" do
    get operation_path(@operation)
    assert_response :success
    assert_select "title", "BarCVVR Opération de "+User.find(@operation.user_id).firstName
  end

  test "should get new" do
    get "/operations/new?userid="+@operation.user_id.to_s
    assert_response :success
    assert_select "title", "BarCVVR Tournée de "+User.find(@operation.user_id).firstName
  end

  test "should get add" do
    get "/operations/add?userid="+@operation.user_id.to_s
    assert_response :success
    assert_select "title", "BarCVVR Renflouage de "+User.find(@operation.user_id).firstName
  end

  test "should get edit" do
    get edit_operation_path(@operation)
    assert_response :success
    assert_select "title", "BarCVVR Edition de l'Opération de "+User.find(@operation.user_id).firstName
  end
end
