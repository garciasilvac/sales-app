require "application_system_test_case"

class DeliveryTypesTest < ApplicationSystemTestCase
  setup do
    @delivery_type = delivery_types(:one)
  end

  test "visiting the index" do
    visit delivery_types_url
    assert_selector "h1", text: "Delivery Types"
  end

  test "creating a Delivery type" do
    visit delivery_types_url
    click_on "New Delivery Type"

    check "Deleted" if @delivery_type.deleted
    fill_in "Name", with: @delivery_type.name
    click_on "Create Delivery type"

    assert_text "Delivery type was successfully created"
    click_on "Back"
  end

  test "updating a Delivery type" do
    visit delivery_types_url
    click_on "Edit", match: :first

    check "Deleted" if @delivery_type.deleted
    fill_in "Name", with: @delivery_type.name
    click_on "Update Delivery type"

    assert_text "Delivery type was successfully updated"
    click_on "Back"
  end

  test "destroying a Delivery type" do
    visit delivery_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Delivery type was successfully destroyed"
  end
end
