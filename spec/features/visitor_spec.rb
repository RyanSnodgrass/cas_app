require 'rails_helper'
require 'rack/fake_cas'
require 'factory_girl'
require 'capybara/rspec'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
options = { js_errors: false }
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, options)
end

describe 'login feature' do
  it "will pass through to my app's root page" do
    visit('/')
    fill_in 'username', with: 'johndoe'
    fill_in 'password', with: 'any password'
    click_button 'Login'
    expect(page).to have_content('Find me in app/views/secrets/show.html.erb')
    page.driver.reset!
  end
end

describe 'stuff which requires js', js: true do
  xit 'will visit an external webpage' do
    visit('http://example.com')
    expect(page).to have_content('Example Domain')
  end
end
