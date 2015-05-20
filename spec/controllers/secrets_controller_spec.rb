require 'rails_helper'
require './helpers'

RSpec.configure do |c|
  c.include Helpers
end
RSpec.describe SecretsController, :type => :controller do
  it "has access to the helper methods defined in the helper module" do
    expect(help).to be(:available)
  end
  describe "GET #show" do
    # render_views
    context 'unauthorized' do
      it 'renders 401 status' do
        get :show
        expect(response.status).to eq(401)
      end
    end
    context 'authorized' do
      it 'does stuff with controller stubbing' do
        # controller.stub(:authenticate)
        get :show
        expect(response.status).to eq(200)
      end
    end
  end
end