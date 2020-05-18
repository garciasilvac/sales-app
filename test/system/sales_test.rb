require "application_system_test_case"

class SalesTest < ApplicationSystemTestCase
  setup do
    @sale = sales(:one)
  end

  test "visiting the index" do
    visit sales_url
    assert_selector "h1", text: "Sales"
  end

  test "creating a Sale" do
    visit sales_url
    click_on "New Sale"

    fill_in "Client", with: @sale.client_id
    check "Deleted" if @sale.deleted
    fill_in "Delivery type", with: @sale.delivery_type_id
    check "Paid" if @sale.paid
    fill_in "Payment type", with: @sale.payment_type_id
    fill_in "Sale datetime", with: @sale.sale_datetime
    fill_in "Total amount", with: @sale.total_amount
    click_on "Create Sale"

    assert_text "Sale was successfully created"
    click_on "Back"
  end

  test "updating a Sale" do
    visit sales_url
    click_on "Edit", match: :first

    fill_in "Client", with: @sale.client_id
    check "Deleted" if @sale.deleted
    fill_in "Delivery type", with: @sale.delivery_type_id
    check "Paid" if @sale.paid
    fill_in "Payment type", with: @sale.payment_type_id
    fill_in "Sale datetime", with: @sale.sale_datetime
    fill_in "Total amount", with: @sale.total_amount
    click_on "Update Sale"

    assert_text "Sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Sale" do
    visit sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sale was successfully destroyed"
  end
end
