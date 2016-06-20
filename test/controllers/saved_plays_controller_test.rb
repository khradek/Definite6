require 'test_helper'

class SavedPlaysControllerTest < ActionController::TestCase
  setup do
    @saved_play = saved_plays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saved_plays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saved_play" do
    assert_difference('SavedPlay.count') do
      post :create, saved_play: { title: @saved_play.title, user_id: @saved_play.user_id }
    end

    assert_redirected_to saved_play_path(assigns(:saved_play))
  end

  test "should show saved_play" do
    get :show, id: @saved_play
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saved_play
    assert_response :success
  end

  test "should update saved_play" do
    patch :update, id: @saved_play, saved_play: { title: @saved_play.title, user_id: @saved_play.user_id }
    assert_redirected_to saved_play_path(assigns(:saved_play))
  end

  test "should destroy saved_play" do
    assert_difference('SavedPlay.count', -1) do
      delete :destroy, id: @saved_play
    end

    assert_redirected_to saved_plays_path
  end
end
