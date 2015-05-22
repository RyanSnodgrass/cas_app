require 'rails_helper'
require 'rack/fake_cas'
describe 'Posts' do
  before :each do
    visit('/')
    fill_in 'username', with: 'johndoe'
    fill_in 'password', with: 'any password'
    click_button 'Login'
  end
  it 'will show a list of all posts' do
    this_post = create(:post)
    that_post = create(:post)
    click_link 'List of All Posts'
    expect(page).to have_content("#{this_post.title}   #{that_post.title}")
  end
  # it "will show a list of the current_user's posts" do
  #   visit('/')
  #   fill_in 'username', with: 'johndoe'
  #   fill_in 'password', with: 'any password'
  #   click_button 'Login'
  #   my_post = create(:post)

  # end
  # it 'will post a blog post' do
  # end
end
