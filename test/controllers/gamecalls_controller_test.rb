require 'test_helper'

class GamecallsControllerTest < ActionController::TestCase
  setup do
    @gamecall = gamecalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gamecalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gamecall" do
    assert_difference('Gamecall.count') do
      post :create, gamecall: { end_time: @gamecall.end_time, event_id: @gamecall.event_id, gdata: @gamecall.gdata, start_time: @gamecall.start_time, title: @gamecall.title, user_id: @gamecall.user_id }
    end

    assert_redirected_to gamecall_path(assigns(:gamecall))
  end

  test "should show gamecall" do
    get :show, id: @gamecall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gamecall
    assert_response :success
  end

  test "should update gamecall" do
    patch :update, id: @gamecall, gamecall: { end_time: @gamecall.end_time, event_id: @gamecall.event_id, gdata: @gamecall.gdata, start_time: @gamecall.start_time, title: @gamecall.title, user_id: @gamecall.user_id }
    assert_redirected_to gamecall_path(assigns(:gamecall))
  end

  test "should destroy gamecall" do
    assert_difference('Gamecall.count', -1) do
      delete :destroy, id: @gamecall
    end

    assert_redirected_to gamecalls_path
  end
end
