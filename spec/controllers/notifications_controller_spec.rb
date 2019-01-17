# frozen_string_literal: true

require 'rails_helper'
require 'notifications_controller'

RSpec.describe NotificationsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:notification) { FactoryBot.create(:notification, user_id: user.id) }
  let!(:sended_notification) { FactoryBot.create(:notification, user_id: user.id, sended: true) }

  let(:params) { FactoryBot.attributes_for(:notification, user_id: user.id) }

  let(:wrong_params) { FactoryBot.attributes_for(:notification) }

  let(:params_for_update) { { id: notification.id, **params } }
  let(:wrong_params_for_update) { { id: notification.id, **wrong_params } }

  describe 'GET #index' do
    context 'success' do
      it 'should return status success' do
        get user_notifications_path(user)
        expect(response).to have_http_status(:success)
        expect(response).to render_template :index
      end

      xit 'should return users' do
        get :index, user_id: user.id
        expect(assigns(:notifications)).to eq([notification])
      end
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      xit 'saves the new notification in the database' do
        expect { post(:create, params: { notification: params }) }.to change(Notification, :count).by(1)
      end

      xit 'redirects to users#index' do
        post :create, params: { notification: params }
        expect(response).to redirect_to user_notifications_path
      end
    end

    context 'with invalid attributes' do
      xit 'does not save the new notification in the database' do
        expect { post(:create, params: { notification: wrong_params }) }.to change(Notification, :count).by(0)
      end

      xit 're-renders the :new template' do
        post :create, params: { notification: wrong_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    context 'valid attributes' do
      it 'locates the requested @notification'
      it "changes the contact's attributes"
      it 'redirects to the updated notification'
    end
    context 'invalid attributes' do
      it 'locates the requested @notification'
      it "does not change the notification's attributes"
      it 're-renders the edit method'
    end
  end

  describe 'DELETE #destroy' do
    xit 'should delete notification' do
      expect { delete :destroy, params: { id: notification.id, user_id: user.id } }.to change(Notification, :count).by(-1)
    end

    xit 'redirects to notifications#index' do
      delete :destroy, params: { id: notification.id, user_id: user.id }
      expect(response).to redirect_to user_notifications_path
    end
  end
end
