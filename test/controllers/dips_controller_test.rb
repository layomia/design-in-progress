require 'test_helper'

class DipsControllerTest < ActionController::TestCase
  setup do
    @dip = dips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dip" do
    assert_difference('Dip.count') do
      post :create, dip: {  }
    end

    assert_redirected_to dip_path(assigns(:dip))
  end

  test "should show dip" do
    get :show, id: @dip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dip
    assert_response :success
  end

  test "should update dip" do
    patch :update, id: @dip, dip: {  }
    assert_redirected_to dip_path(assigns(:dip))
  end

  test "should destroy dip" do
    assert_difference('Dip.count', -1) do
      delete :destroy, id: @dip
    end

    assert_redirected_to dips_path
  end
end
