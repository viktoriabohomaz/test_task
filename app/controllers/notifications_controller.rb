class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  def index
    @notifications = Notification.all
  end

  def show
  end

  def new
    @notification = Notification.new
  end

  def edit
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      redirect_to @notification, notice: 'Notification was successfully created.' 
    else
      render :new 
    end
  end

  def update
      if @notification.update(notification_params)
        redirect_to @notification, notice: 'Notification was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @notification.destroy
    redirect_to notifications_url, notice: 'Notification was successfully destroyed.' 
  end

  private

    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:title, :description, :date, :time)
    end
end
