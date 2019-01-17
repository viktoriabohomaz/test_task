# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }

  let(:params) { FactoryBot.attributes_for(:user) }

  let(:wrong_params) { FactoryBot.attributes_for(:user, email: nil) }

  describe 'GET #index' do
    context 'success' do
      it 'should return status success' do
        get :index
        expect(response).to have_http_status(:success)
        expect(response).to render_template :index
      end

      it 'should return users' do
        get :index
        expect(assigns(:users)).to eq([user])
      end
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new user in the database' do
        expect { post(:create, params: { user: params }) }.to change(User, :count).by(1)
      end

      it 'redirects to users#index' do
        post :create, params: { user: params }
        expect(response).to redirect_to users_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new user in the database' do
        expect { post(:create, params: { user: wrong_params }) }.to change(User, :count).by(0)
      end

      it 're-renders the :new template' do
        post :create, params: { user: wrong_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete user' do
      expect { delete :destroy, params: { id: user.id } }.to change(User, :count).by(-1)
    end

    it 'redirects to users#index' do
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to users_path
    end
  end
end
