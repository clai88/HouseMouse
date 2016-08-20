require 'test_helper'

class HouseControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get house_new_url
    assert_response :success
  end

  test "should get create" do
    get house_create_url
    assert_response :success
  end

  test "should get index" do
    get house_index_url
    assert_response :success
  end

end
