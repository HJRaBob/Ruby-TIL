require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get lunch" do
    get :lunch
    assert_response :success
  end

  test "should get god_make" do
    get :god_make
    assert_response :success
  end

  test "should get youre" do
    get :youre
    assert_response :success
  end

  test "should get my_rand" do
    get :my_rand
    assert_response :success
  end

end
