require 'test_helper'

class SavedFormationsControllerTest < ActionController::TestCase
  setup do
    @saved_formation = saved_formations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saved_formations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saved_formation" do
    assert_difference('SavedFormation.count') do
      post :create, saved_formation: { title: @saved_formation.title, user_id: @saved_formation.user_id }
    end

    assert_redirected_to saved_formation_path(assigns(:saved_formation))
  end

  test "should show saved_formation" do
    get :show, id: @saved_formation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saved_formation
    assert_response :success
  end

  test "should update saved_formation" do
    patch :update, id: @saved_formation, saved_formation: { title: @saved_formation.title, user_id: @saved_formation.user_id }
    assert_redirected_to saved_formation_path(assigns(:saved_formation))
  end

  test "should destroy saved_formation" do
    assert_difference('SavedFormation.count', -1) do
      delete :destroy, id: @saved_formation
    end

    assert_redirected_to saved_formations_path
  end
end
