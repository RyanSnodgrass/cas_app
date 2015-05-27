require 'rails_helper'
describe 'Person Class' do
  # Just remember that the 'build' method only creates the object
  # It doesn't actually save it on the Database
  let(:person) { create(:person) }

  it 'is valid' do
    expect(person).to be_valid
  end
  it 'starts with no posts' do
    expect(person.posts).to be_empty
  end
  it 'can create an association with posts' do
    person.posts << create(:post)
    expect(person.posts).not_to be_empty
  end

  it 'can create an association with comments' do
    person.comments << create(:comment)
    expect(person.comments).not_to be_empty
  end
end
