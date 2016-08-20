require 'test_helper'

class HouseControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get house_create_url
    assert_response :success
  end

  test "should get search" do
    get house_search_url
    assert_response :success
  end

  test "should get show" do
    get house_show_url
    assert_response :success
  end

end
