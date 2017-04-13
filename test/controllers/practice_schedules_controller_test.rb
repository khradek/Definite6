require 'test_helper'

class PracticeSchedulesControllerTest < ActionController::TestCase
  setup do
    @practice_schedule = practice_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:practice_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create practice_schedule" do
    assert_difference('PracticeSchedule.count') do
      post :create, practice_schedule: { title: @practice_schedule.title }
    end

    assert_redirected_to practice_schedule_path(assigns(:practice_schedule))
  end

  test "should show practice_schedule" do
    get :show, id: @practice_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @practice_schedule
    assert_response :success
  end

  test "should update practice_schedule" do
    patch :update, id: @practice_schedule, practice_schedule: { title: @practice_schedule.title }
    assert_redirected_to practice_schedule_path(assigns(:practice_schedule))
  end

  test "should destroy practice_schedule" do
    assert_difference('PracticeSchedule.count', -1) do
      delete :destroy, id: @practice_schedule
    end

    assert_redirected_to practice_schedules_path
  end
end
