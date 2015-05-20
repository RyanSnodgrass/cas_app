require 'rails_helper'
RSpec.describe SecretsController do
  describe 'GET #show' do
    let(:set_current_user) { 
      user = create(:person)
      session['cas'] = { 'user' => user.name }
    }

    context 'unauthorized' do
      it 'renders 401 status' do
        get :show
        expect(response.status).to eq(401)
      end
    end

    context 'authorization' do
      it 'works manually and renders 200' do
        user = create(:person)
        session['cas'] = { 'user' => user.name }
        get :show
        expect(response.status).to eq(200)
      end
      it 'works with a `:let` method and renders 200' do
        set_current_user
        get :show
        expect(response.status).to eq(200)
      end
    end
  end
end