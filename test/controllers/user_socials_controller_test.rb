require 'test_helper'

class UserSocialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_social = user_socials(:one)
  end

  test "should get index" do
    get user_socials_url
    assert_response :success
  end

  test "should get new" do
    get new_user_social_url
    assert_response :success
  end

  test "should create user_social" do
    assert_difference('UserSocial.count') do
      post user_socials_url, params: { user_social: {  } }
    end

    assert_redirected_to user_social_url(UserSocial.last)
  end

  test "should show user_social" do
    get user_social_url(@user_social)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_social_url(@user_social)
    assert_response :success
  end

  test "should update user_social" do
    patch user_social_url(@user_social), params: { user_social: {  } }
    assert_redirected_to user_social_url(@user_social)
  end

  test "should destroy user_social" do
    assert_difference('UserSocial.count', -1) do
      delete user_social_url(@user_social)
    end

    assert_redirected_to user_socials_url
  end
end
