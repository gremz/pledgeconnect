require 'test_helper'

class ScheduledNotificationsControllerTest < ActionController::TestCase
  setup do
    @scheduled_notification = scheduled_notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scheduled_notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scheduled_notification" do
    assert_difference('ScheduledNotification.count') do
      post :create, scheduled_notification: { end_date: @scheduled_notification.end_date, frequency: @scheduled_notification.frequency, message_content: @scheduled_notification.message_content, ongoing: @scheduled_notification.ongoing, provider_id: @scheduled_notification.provider_id, start_date: @scheduled_notification.start_date }
    end

    assert_redirected_to scheduled_notification_path(assigns(:scheduled_notification))
  end

  test "should show scheduled_notification" do
    get :show, id: @scheduled_notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scheduled_notification
    assert_response :success
  end

  test "should update scheduled_notification" do
    patch :update, id: @scheduled_notification, scheduled_notification: { end_date: @scheduled_notification.end_date, frequency: @scheduled_notification.frequency, message_content: @scheduled_notification.message_content, ongoing: @scheduled_notification.ongoing, provider_id: @scheduled_notification.provider_id, start_date: @scheduled_notification.start_date }
    assert_redirected_to scheduled_notification_path(assigns(:scheduled_notification))
  end

  test "should destroy scheduled_notification" do
    assert_difference('ScheduledNotification.count', -1) do
      delete :destroy, id: @scheduled_notification
    end

    assert_redirected_to scheduled_notifications_path
  end
end
