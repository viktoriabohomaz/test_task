class NotificationsController < ApplicationController
  before_action :initialize_notification, only: [:show, :edit, :update, :destroy]
  before_action :initialize_user

  def index
    @notifications =  @user.notifications
  end

  def show
  end

  def new
    @notification = Notification.new
  end

  def edit
  end

  def create
    @notification = @user.notifications.create(notification_params)
    if @notification.save
      redirect_to user_notifications_url(@user), notice: 'Notification was successfully created.' 
    else
      render :new 
    end
  end

  def update
    if @notification.update(notification_params)
      redirect_to user_notifications_url(@user), notice: 'Notification was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @notification.destroy
    redirect_to user_notifications_url(@user), notice: 'Notification was successfully destroyed.' 
  end

  private

    def initialize_user
      @user = User.find(params[:user_id])
    end

    def initialize_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:title, :description, :date, :time)
    end
end
