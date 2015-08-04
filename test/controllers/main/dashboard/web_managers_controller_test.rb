require 'test_helper'

class Main::Dashboard::WebManagersControllerTest < ActionController::TestCase
  test "should get announcement" do
    get :announcement
    assert_response :success
  end

  test "should get primary" do
    get :primary
    assert_response :success
  end

  test "should get commitee" do
    get :commitee
    assert_response :success
  end

  test "should get themes" do
    get :themes
    assert_response :success
  end

  test "should get regulation" do
    get :regulation
    assert_response :success
  end

end
