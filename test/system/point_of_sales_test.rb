require "application_system_test_case"

class PointOfSalesTest < ApplicationSystemTestCase
  setup do
    @point_of_sale = point_of_sales(:one)
  end

  test "visiting the index" do
    visit point_of_sales_url
    assert_selector "h1", text: "Point Of Sales"
  end

  test "creating a Point of sale" do
    visit point_of_sales_url
    click_on "New Point Of Sale"

    fill_in "Adressable", with: @point_of_sale.adressable_id
    fill_in "Adressable type", with: @point_of_sale.adressable_type
    check "Deleted" if @point_of_sale.deleted
    fill_in "Name", with: @point_of_sale.name
    click_on "Create Point of sale"

    assert_text "Point of sale was successfully created"
    click_on "Back"
  end

  test "updating a Point of sale" do
    visit point_of_sales_url
    click_on "Edit", match: :first

    fill_in "Adressable", with: @point_of_sale.adressable_id
    fill_in "Adressable type", with: @point_of_sale.adressable_type
    check "Deleted" if @point_of_sale.deleted
    fill_in "Name", with: @point_of_sale.name
    click_on "Update Point of sale"

    assert_text "Point of sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Point of sale" do
    visit point_of_sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Point of sale was successfully destroyed"
  end
end
