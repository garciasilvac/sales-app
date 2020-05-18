require 'test_helper'

class SubtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subtype = subtypes(:one)
  end

  test "should get index" do
    get subtypes_url
    assert_response :success
  end

  test "should get new" do
    get new_subtype_url
    assert_response :success
  end

  test "should create subtype" do
    assert_difference('Subtype.count') do
      post subtypes_url, params: { subtype: { deleted: @subtype.deleted, modif_date: @subtype.modif_date, name: @subtype.name, type_id: @subtype.type_id } }
    end

    assert_redirected_to subtype_url(Subtype.last)
  end

  test "should show subtype" do
    get subtype_url(@subtype)
    assert_response :success
  end

  test "should get edit" do
    get edit_subtype_url(@subtype)
    assert_response :success
  end

  test "should update subtype" do
    patch subtype_url(@subtype), params: { subtype: { deleted: @subtype.deleted, modif_date: @subtype.modif_date, name: @subtype.name, type_id: @subtype.type_id } }
    assert_redirected_to subtype_url(@subtype)
  end

  test "should destroy subtype" do
    assert_difference('Subtype.count', -1) do
      delete subtype_url(@subtype)
    end

    assert_redirected_to subtypes_url
  end
end
