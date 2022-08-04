require "application_system_test_case"

class UserSocialsTest < ApplicationSystemTestCase
  setup do
    @user_social = user_socials(:one)
  end

  test "visiting the index" do
    visit user_socials_url
    assert_selector "h1", text: "User Socials"
  end

  test "creating a User social" do
    visit user_socials_url
    click_on "New User Social"

    click_on "Create User social"

    assert_text "User social was successfully created"
    click_on "Back"
  end

  test "updating a User social" do
    visit user_socials_url
    click_on "Edit", match: :first

    click_on "Update User social"

    assert_text "User social was successfully updated"
    click_on "Back"
  end

  test "destroying a User social" do
    visit user_socials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User social was successfully destroyed"
  end
end
