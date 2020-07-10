require 'test_helper'

class CostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cost = costs(:one)
  end

  test "should get index" do
    get costs_url
    assert_response :success
  end

  test "should get new" do
    get new_cost_url
    assert_response :success
  end

  test "should create cost" do
    assert_difference('Cost.count') do
      post costs_url, params: { cost: { deleted: @cost.deleted, document_id: @cost.document_id, name: @cost.name, value: @cost.value } }
    end

    assert_redirected_to cost_url(Cost.last)
  end

  test "should show cost" do
    get cost_url(@cost)
    assert_response :success
  end

  test "should get edit" do
    get edit_cost_url(@cost)
    assert_response :success
  end

  test "should update cost" do
    patch cost_url(@cost), params: { cost: { deleted: @cost.deleted, document_id: @cost.document_id, name: @cost.name, value: @cost.value } }
    assert_redirected_to cost_url(@cost)
  end

  test "should destroy cost" do
    assert_difference('Cost.count', -1) do
      delete cost_url(@cost)
    end

    assert_redirected_to costs_url
  end
end
