class ScheduledNotificationsController < ApplicationController
  before_action :set_scheduled_notification, only: [:show, :edit, :update, :destroy]

  # GET /scheduled_notifications
  # GET /scheduled_notifications.json
  def index
    @scheduled_notifications = ScheduledNotification.all
  end

  # GET /scheduled_notifications/1
  # GET /scheduled_notifications/1.json
  def show
  end

  # GET /scheduled_notifications/new
  def new
    @scheduled_notification = ScheduledNotification.new
  end

  # GET /scheduled_notifications/1/edit
  def edit
  end

  # POST /scheduled_notifications
  # POST /scheduled_notifications.json
  def create
    @scheduled_notification = ScheduledNotification.new(scheduled_notification_params)

    respond_to do |format|
      if @scheduled_notification.save
        format.html { redirect_to @scheduled_notification, notice: 'Scheduled notification was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scheduled_notification }
      else
        format.html { render action: 'new' }
        format.json { render json: @scheduled_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduled_notifications/1
  # PATCH/PUT /scheduled_notifications/1.json
  def update
    respond_to do |format|
      if @scheduled_notification.update(scheduled_notification_params)
        format.html { redirect_to @scheduled_notification, notice: 'Scheduled notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scheduled_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduled_notifications/1
  # DELETE /scheduled_notifications/1.json
  def destroy
    @scheduled_notification.destroy
    respond_to do |format|
      format.html { redirect_to scheduled_notifications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_notification
      @scheduled_notification = ScheduledNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scheduled_notification_params
      params.require(:scheduled_notification).permit(:provider_id, :start_date, :end_date, :ongoing, :frequency, :message_content)
    end
end
