require "application_system_test_case"

class SubtypesTest < ApplicationSystemTestCase
  setup do
    @subtype = subtypes(:one)
  end

  test "visiting the index" do
    visit subtypes_url
    assert_selector "h1", text: "Subtypes"
  end

  test "creating a Subtype" do
    visit subtypes_url
    click_on "New Subtype"

    check "Deleted" if @subtype.deleted
    fill_in "Modif date", with: @subtype.modif_date
    fill_in "Name", with: @subtype.name
    fill_in "Type", with: @subtype.type_id
    click_on "Create Subtype"

    assert_text "Subtype was successfully created"
    click_on "Back"
  end

  test "updating a Subtype" do
    visit subtypes_url
    click_on "Edit", match: :first

    check "Deleted" if @subtype.deleted
    fill_in "Modif date", with: @subtype.modif_date
    fill_in "Name", with: @subtype.name
    fill_in "Type", with: @subtype.type_id
    click_on "Update Subtype"

    assert_text "Subtype was successfully updated"
    click_on "Back"
  end

  test "destroying a Subtype" do
    visit subtypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subtype was successfully destroyed"
  end
end
