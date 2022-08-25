require 'test_helper'

class UserProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_product = user_products(:one)
  end

  test "should get index" do
    get user_products_url
    assert_response :success
  end

  test "should get new" do
    get new_user_product_url
    assert_response :success
  end

  test "should create user_product" do
    assert_difference('UserProduct.count') do
      post user_products_url, params: { user_product: {  } }
    end

    assert_redirected_to user_product_url(UserProduct.last)
  end

  test "should show user_product" do
    get user_product_url(@user_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_product_url(@user_product)
    assert_response :success
  end

  test "should update user_product" do
    patch user_product_url(@user_product), params: { user_product: {  } }
    assert_redirected_to user_product_url(@user_product)
  end

  test "should destroy user_product" do
    assert_difference('UserProduct.count', -1) do
      delete user_product_url(@user_product)
    end

    assert_redirected_to user_products_url
  end
end
