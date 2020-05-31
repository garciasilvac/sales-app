require "application_system_test_case"

class TimeblocksTest < ApplicationSystemTestCase
  setup do
    @timeblock = timeblocks(:one)
  end

  test "visiting the index" do
    visit timeblocks_url
    assert_selector "h1", text: "Timeblocks"
  end

  test "creating a Timeblock" do
    visit timeblocks_url
    click_on "New Timeblock"

    check "Deleted" if @timeblock.deleted
    fill_in "Name", with: @timeblock.name
    click_on "Create Timeblock"

    assert_text "Timeblock was successfully created"
    click_on "Back"
  end

  test "updating a Timeblock" do
    visit timeblocks_url
    click_on "Edit", match: :first

    check "Deleted" if @timeblock.deleted
    fill_in "Name", with: @timeblock.name
    click_on "Update Timeblock"

    assert_text "Timeblock was successfully updated"
    click_on "Back"
  end

  test "destroying a Timeblock" do
    visit timeblocks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Timeblock was successfully destroyed"
  end
end
