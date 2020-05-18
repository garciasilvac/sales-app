require "application_system_test_case"

class AdressesTest < ApplicationSystemTestCase
  setup do
    @adress = adresses(:one)
  end

  test "visiting the index" do
    visit adresses_url
    assert_selector "h1", text: "Adresses"
  end

  test "creating a Adress" do
    visit adresses_url
    click_on "New Adress"

    fill_in "Adr country", with: @adress.adr_country
    fill_in "Adr county", with: @adress.adr_county
    fill_in "Adr other", with: @adress.adr_other
    fill_in "Adr state", with: @adress.adr_state
    fill_in "Adr unit", with: @adress.adr_unit
    fill_in "Adr zip", with: @adress.adr_zip
    fill_in "Str number", with: @adress.str_number
    fill_in "Street", with: @adress.street
    click_on "Create Adress"

    assert_text "Adress was successfully created"
    click_on "Back"
  end

  test "updating a Adress" do
    visit adresses_url
    click_on "Edit", match: :first

    fill_in "Adr country", with: @adress.adr_country
    fill_in "Adr county", with: @adress.adr_county
    fill_in "Adr other", with: @adress.adr_other
    fill_in "Adr state", with: @adress.adr_state
    fill_in "Adr unit", with: @adress.adr_unit
    fill_in "Adr zip", with: @adress.adr_zip
    fill_in "Str number", with: @adress.str_number
    fill_in "Street", with: @adress.street
    click_on "Update Adress"

    assert_text "Adress was successfully updated"
    click_on "Back"
  end

  test "destroying a Adress" do
    visit adresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adress was successfully destroyed"
  end
end
