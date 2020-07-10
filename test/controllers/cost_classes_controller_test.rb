require 'test_helper'

class CostClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cost_class = cost_classes(:one)
  end

  test "should get index" do
    get cost_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_cost_class_url
    assert_response :success
  end

  test "should create cost_class" do
    assert_difference('CostClass.count') do
      post cost_classes_url, params: { cost_class: { deleted: @cost_class.deleted, name: @cost_class.name, parent_id: @cost_class.parent_id } }
    end

    assert_redirected_to cost_class_url(CostClass.last)
  end

  test "should show cost_class" do
    get cost_class_url(@cost_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_cost_class_url(@cost_class)
    assert_response :success
  end

  test "should update cost_class" do
    patch cost_class_url(@cost_class), params: { cost_class: { deleted: @cost_class.deleted, name: @cost_class.name, parent_id: @cost_class.parent_id } }
    assert_redirected_to cost_class_url(@cost_class)
  end

  test "should destroy cost_class" do
    assert_difference('CostClass.count', -1) do
      delete cost_class_url(@cost_class)
    end

    assert_redirected_to cost_classes_url
  end
end
