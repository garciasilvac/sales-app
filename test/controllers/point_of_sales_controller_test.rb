require 'test_helper'

class PointOfSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @point_of_sale = point_of_sales(:one)
  end

  test "should get index" do
    get point_of_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_point_of_sale_url
    assert_response :success
  end

  test "should create point_of_sale" do
    assert_difference('PointOfSale.count') do
      post point_of_sales_url, params: { point_of_sale: { adressable_id: @point_of_sale.adressable_id, adressable_type: @point_of_sale.adressable_type, deleted: @point_of_sale.deleted, name: @point_of_sale.name } }
    end

    assert_redirected_to point_of_sale_url(PointOfSale.last)
  end

  test "should show point_of_sale" do
    get point_of_sale_url(@point_of_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_point_of_sale_url(@point_of_sale)
    assert_response :success
  end

  test "should update point_of_sale" do
    patch point_of_sale_url(@point_of_sale), params: { point_of_sale: { adressable_id: @point_of_sale.adressable_id, adressable_type: @point_of_sale.adressable_type, deleted: @point_of_sale.deleted, name: @point_of_sale.name } }
    assert_redirected_to point_of_sale_url(@point_of_sale)
  end

  test "should destroy point_of_sale" do
    assert_difference('PointOfSale.count', -1) do
      delete point_of_sale_url(@point_of_sale)
    end

    assert_redirected_to point_of_sales_url
  end
end
