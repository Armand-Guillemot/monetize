require "application_system_test_case"

class UserProductsTest < ApplicationSystemTestCase
  setup do
    @user_product = user_products(:one)
  end

  test "visiting the index" do
    visit user_products_url
    assert_selector "h1", text: "User Products"
  end

  test "creating a User product" do
    visit user_products_url
    click_on "New User Product"

    click_on "Create User product"

    assert_text "User product was successfully created"
    click_on "Back"
  end

  test "updating a User product" do
    visit user_products_url
    click_on "Edit", match: :first

    click_on "Update User product"

    assert_text "User product was successfully updated"
    click_on "Back"
  end

  test "destroying a User product" do
    visit user_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User product was successfully destroyed"
  end
end
