require 'test_helper'

class ScheduledGroupsControllerTest < ActionController::TestCase
  setup do
    @scheduled_group = scheduled_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scheduled_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scheduled_group" do
    assert_difference('ScheduledGroup.count') do
      post :create, scheduled_group: { schedule_id: @scheduled_group.schedule_id }
    end

    assert_redirected_to scheduled_group_path(assigns(:scheduled_group))
  end

  test "should show scheduled_group" do
    get :show, id: @scheduled_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scheduled_group
    assert_response :success
  end

  test "should update scheduled_group" do
    patch :update, id: @scheduled_group, scheduled_group: { schedule_id: @scheduled_group.schedule_id }
    assert_redirected_to scheduled_group_path(assigns(:scheduled_group))
  end

  test "should destroy scheduled_group" do
    assert_difference('ScheduledGroup.count', -1) do
      delete :destroy, id: @scheduled_group
    end

    assert_redirected_to scheduled_groups_path
  end
end
