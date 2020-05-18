require 'test_helper'

class DeliveryTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery_type = delivery_types(:one)
  end

  test "should get index" do
    get delivery_types_url
    assert_response :success
  end

  test "should get new" do
    get new_delivery_type_url
    assert_response :success
  end

  test "should create delivery_type" do
    assert_difference('DeliveryType.count') do
      post delivery_types_url, params: { delivery_type: { deleted: @delivery_type.deleted, name: @delivery_type.name } }
    end

    assert_redirected_to delivery_type_url(DeliveryType.last)
  end

  test "should show delivery_type" do
    get delivery_type_url(@delivery_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_delivery_type_url(@delivery_type)
    assert_response :success
  end

  test "should update delivery_type" do
    patch delivery_type_url(@delivery_type), params: { delivery_type: { deleted: @delivery_type.deleted, name: @delivery_type.name } }
    assert_redirected_to delivery_type_url(@delivery_type)
  end

  test "should destroy delivery_type" do
    assert_difference('DeliveryType.count', -1) do
      delete delivery_type_url(@delivery_type)
    end

    assert_redirected_to delivery_types_url
  end
end
