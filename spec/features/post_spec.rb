require 'rails_helper'
require 'rack/fake_cas'

describe 'Posts' do
  before :each do
    visit('/')
    fill_in 'username', with: 'johndoe'
    fill_in 'password', with: 'any password'
    click_button 'Login'
  end
  it 'will post a blog post' do
  end
  it 'will show a list of my posts' do
  end
end