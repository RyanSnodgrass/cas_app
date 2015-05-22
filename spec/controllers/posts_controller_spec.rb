require 'rails_helper'
RSpec.describe PostsController do
  describe 'GET #index' do
    context 'unauthorized' do
      it 'renders 401 status' do
        get :index
        expect(response.status).to eq(401)
      end
    end

    context 'authorization' do
      render_views
      it 'renders 200' do
        set_current_user(build(:person))
        get :index
        expect(response.status).to eq(200)
      end
      it 'renders the index page' do
        set_current_user(build(:person))
        get :index
        expect(response).to render_template(:index)
      end
      it 'populates an array of posts' do
        set_current_user(build(:person))
        this_post = create(:post)
        that_post = create(:post)
        get :index
        expect(assigns(:posts)).to eq([this_post, that_post])
      end
    end
  end
end
