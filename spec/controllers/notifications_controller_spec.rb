# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:notification) { FactoryBot.create(:notification, user_id: user.id) }
  let!(:sended_notification) { FactoryBot.create(:notification, user_id: user.id, sended: true) }

  let(:params) { FactoryBot.attributes_for(:notification, user_id: user.id) }

  let(:wrong_params) { FactoryBot.attributes_for(:notification, title: nil) }

  describe 'GET #index' do
    context 'success' do
      it 'should return status success' do
        get :index, params: { user_id: user.id }
        expect(response).to have_http_status(:success)
        expect(response).to render_template :index
      end
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new notification in the database' do
        expect { post(:create, params: { user_id: user.id, notification: params }) }.to change(Notification, :count).by(1)
      end

      it 'redirects to users#index' do
        post :create, params: { user_id: user.id, notification: params }
        expect(response).to redirect_to user_notifications_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new notification in the database' do
        expect { post(:create, params: { user_id: user.id, notification: wrong_params }) }.to change(Notification, :count).by(0)
      end

      it 're-renders the :new template' do
        post :create, params: { user_id: user.id, notification: wrong_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    context 'valid attributes' do
      it "changes the notification's attributes" do
        put :update, params: { user_id: user.id, id: notification.id, notification: params }
        expect(response).to redirect_to user_notifications_path
      end
    end

    context 'invalid attributes' do
      it 're-renders the edit method' do
        put :update, params: { user_id: user.id, id: notification.id, notification: wrong_params }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete notification' do
      expect { delete :destroy, params: { user_id: user.id, id: notification.id } }.to change(Notification, :count).by(-1)
    end

    it 'redirects to notifications#index' do
      delete :destroy, params: { user_id: user.id, id: notification.id }
      expect(response).to redirect_to user_notifications_path
    end
  end

  describe 'GET #edit' do
    it 'can`t edit sended notification' do
      get :edit, params: { user_id: user.id, id: sended_notification.id }
      expect(response).to redirect_to user_notifications_url(user)
    end
  end

  describe 'GET #new' do
    it 'raise RecordNotFound' do
      get :new, params: { user_id: 500 }
      expect(response).to redirect_to root_path
    end

    it 'should return status success' do
      get :new, params: { user_id: user.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template :new
    end
  end
end
