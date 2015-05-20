require 'rails_helper'

RSpec.describe 'non standard routing' do
  it 'routes / to secrets#show' do
    expect(get('/')).to route_to('secrets#show')
  end
end