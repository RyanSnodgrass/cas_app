require 'rails_helper'
RSpec.describe SecretsController do
  describe 'GET #show' do
    context 'unauthorized' do
      it 'renders 401 status' do
        get :show
        expect(response.status).to eq(401)
      end
    end

    context 'authorization' do
      it 'works manually and renders 200' do
        user = build(:person)
        session['cas'] = { 'user' => user.name }
        get :show
        expect(response.status).to eq(200)
      end
      it 'works with a helper method and renders 200' do
        set_current_user(create(:person))
        get :show
        expect(response.status).to eq(200)
      end
    end
  end
end
