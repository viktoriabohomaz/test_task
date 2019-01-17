# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :initialize_notification, only: %i[show edit update destroy]
  before_action :initialize_user

  def index
    @notifications = @user.notifications.order(sended: :asc)
  end

  def show; end

  def new
    @notification = Notification.new
  end

  def edit; end

  def create
    @notification = @user.notifications.create(notification_params)
    if @notification.save
      redirect_to user_notifications_url(@user)
    else
      render :new
    end
  end

  def update
    if @notification.update(notification_params)
      redirect_to user_notifications_url(@user)
    else
      render :edit
    end
  end

  def destroy
    @notification.destroy
    redirect_to user_notifications_url(@user)
  end

  private

  def initialize_user
    @user = User.find_by(id: params[:user_id])
  end

  def initialize_notification
    @notification = Notification.find_by(id: params[:id])
  end

  def notification_params
    params.require(:notification).permit(:title, :description, :date, :time)
  end
end
