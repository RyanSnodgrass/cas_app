require 'rails_helper'
RSpec.describe PostsController do
  describe 'GET #index' do
    let(:set_current_user) { 
      user = create(:person)
      session['cas'] = { 'user' => user.name }
    }
    
    context 'unauthorized' do
      it 'renders 401 status' do
        get :index
        expect(response.status).to eq(401)
      end
    end

    context 'authorization' do
      it 'works manually and renders 200' do
        user = create(:person)
        session['cas'] = { 'user' => user.name }
        get :index
        expect(response.status).to eq(200)
      end
      it 'works with a helper method and renders 200' do
        set_current_user
        get :index
        expect(response.status).to eq(200)
      end
    end
  end
end