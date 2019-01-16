require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    context 'success' do
      it 'should return status success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET #show' do
  end
end
