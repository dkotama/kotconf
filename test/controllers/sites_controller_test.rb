require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get proceeding" do
    get :proceeding
    assert_response :success
  end

  test "should get program" do
    get :program
    assert_response :success
  end

end
