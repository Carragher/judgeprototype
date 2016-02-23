require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get home," do
    get :home,
    assert_response :success
  end

  test "should get profile," do
    get :profile,
    assert_response :success
  end

  test "should get setting" do
    get :setting
    assert_response :success
  end

end
