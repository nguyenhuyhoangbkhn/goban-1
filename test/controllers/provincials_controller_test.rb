require 'test_helper'

class ProvincialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provincial = provincials(:one)
  end

  test "should get index" do
    get provincials_url
    assert_response :success
  end

  test "should get new" do
    get new_provincial_url
    assert_response :success
  end

  test "should create provincial" do
    assert_difference('Provincial.count') do
      post provincials_url, params: { provincial: { name: @provincial.name, ordinate: @provincial.ordinate, province_kind: @provincial.province_kind } }
    end

    assert_redirected_to provincial_url(Provincial.last)
  end

  test "should show provincial" do
    get provincial_url(@provincial)
    assert_response :success
  end

  test "should get edit" do
    get edit_provincial_url(@provincial)
    assert_response :success
  end

  test "should update provincial" do
    patch provincial_url(@provincial), params: { provincial: { name: @provincial.name, ordinate: @provincial.ordinate, province_kind: @provincial.province_kind } }
    assert_redirected_to provincial_url(@provincial)
  end

  test "should destroy provincial" do
    assert_difference('Provincial.count', -1) do
      delete provincial_url(@provincial)
    end

    assert_redirected_to provincials_url
  end
end
