require "application_system_test_case"

class DeliveriesTest < ApplicationSystemTestCase
  setup do
    @delivery = deliveries(:one)
  end

  test "visiting the index" do
    visit deliveries_url
    assert_selector "h1", text: "Deliveries"
  end

  test "creating a Delivery" do
    visit deliveries_url
    click_on "New Delivery"

    check "Deleted" if @delivery.deleted
    check "Delivered" if @delivery.delivered
    fill_in "Real date", with: @delivery.real_date
    fill_in "Real timeblock", with: @delivery.real_timeblock
    fill_in "Sale", with: @delivery.sale_id
    fill_in "Sched date", with: @delivery.sched_date
    fill_in "Sched timeblock", with: @delivery.sched_timeblock
    click_on "Create Delivery"

    assert_text "Delivery was successfully created"
    click_on "Back"
  end

  test "updating a Delivery" do
    visit deliveries_url
    click_on "Edit", match: :first

    check "Deleted" if @delivery.deleted
    check "Delivered" if @delivery.delivered
    fill_in "Real date", with: @delivery.real_date
    fill_in "Real timeblock", with: @delivery.real_timeblock
    fill_in "Sale", with: @delivery.sale_id
    fill_in "Sched date", with: @delivery.sched_date
    fill_in "Sched timeblock", with: @delivery.sched_timeblock
    click_on "Update Delivery"

    assert_text "Delivery was successfully updated"
    click_on "Back"
  end

  test "destroying a Delivery" do
    visit deliveries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Delivery was successfully destroyed"
  end
end
