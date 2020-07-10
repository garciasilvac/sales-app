require "application_system_test_case"

class CostClassesTest < ApplicationSystemTestCase
  setup do
    @cost_class = cost_classes(:one)
  end

  test "visiting the index" do
    visit cost_classes_url
    assert_selector "h1", text: "Cost Classes"
  end

  test "creating a Cost class" do
    visit cost_classes_url
    click_on "New Cost Class"

    check "Deleted" if @cost_class.deleted
    fill_in "Name", with: @cost_class.name
    fill_in "Parent", with: @cost_class.parent_id
    click_on "Create Cost class"

    assert_text "Cost class was successfully created"
    click_on "Back"
  end

  test "updating a Cost class" do
    visit cost_classes_url
    click_on "Edit", match: :first

    check "Deleted" if @cost_class.deleted
    fill_in "Name", with: @cost_class.name
    fill_in "Parent", with: @cost_class.parent_id
    click_on "Update Cost class"

    assert_text "Cost class was successfully updated"
    click_on "Back"
  end

  test "destroying a Cost class" do
    visit cost_classes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cost class was successfully destroyed"
  end
end
