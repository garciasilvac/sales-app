require "application_system_test_case"

class ShoppingCartsTest < ApplicationSystemTestCase
  setup do
    @shopping_cart = shopping_carts(:one)
  end

  test "visiting the index" do
    visit shopping_carts_url
    assert_selector "h1", text: "Shopping Carts"
  end

  test "creating a Shopping cart" do
    visit shopping_carts_url
    click_on "New Shopping Cart"

    check "Deleted" if @shopping_cart.deleted
    fill_in "Product", with: @shopping_cart.product_id
    fill_in "Product q", with: @shopping_cart.product_q
    fill_in "Sale", with: @shopping_cart.sale_id
    fill_in "Subtotal", with: @shopping_cart.subtotal
    click_on "Create Shopping cart"

    assert_text "Shopping cart was successfully created"
    click_on "Back"
  end

  test "updating a Shopping cart" do
    visit shopping_carts_url
    click_on "Edit", match: :first

    check "Deleted" if @shopping_cart.deleted
    fill_in "Product", with: @shopping_cart.product_id
    fill_in "Product q", with: @shopping_cart.product_q
    fill_in "Sale", with: @shopping_cart.sale_id
    fill_in "Subtotal", with: @shopping_cart.subtotal
    click_on "Update Shopping cart"

    assert_text "Shopping cart was successfully updated"
    click_on "Back"
  end

  test "destroying a Shopping cart" do
    visit shopping_carts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shopping cart was successfully destroyed"
  end
end
