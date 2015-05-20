require 'rails_helper'

describe 'Comment Class' do
  # Just remember that the 'build' method only creates the object
  # It doesn't actually save it on the Database
  let(:comment) {create(:comment)}
    
  it 'is valid' do
    expect(comment).to be_valid
  end
  it 'starts without a post' do
    expect(comment.post).to be_nil
  end

  it 'can associate a post with itself' do
    @post = create(:post)
    comment.post = @post
    expect(comment.post).to eq(@post)
  end

  it 'can association with an author' do
    person = create(:person)
    comment.author = person
    expect(comment.author).to eq(person)
  end
  
end