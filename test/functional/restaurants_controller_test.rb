require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
