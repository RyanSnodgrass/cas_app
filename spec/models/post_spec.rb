require 'rails_helper'

describe 'Post Class' do
  # Just remember that the 'build' method only creates the object
  # It doesn't actually save it on the Database
  let(:post) { create(:post) }

  it 'is valid' do
    expect(post).to be_valid
  end

  it 'starts with no comments' do
    expect(post.comments).to be_empty
  end

  it 'can create an association with comments' do
    comment = create(:comment)
    this_comment = create(:comment)
    post.comments << comment
    post.save
    expect(post.comments).to eq([this_comment])
  end

  #        post
  #       /     \
  # my_comment   this_comment
  #    |               |
  #  my_person        this_person
  #     |                |     \
  #   my_post      this_post   that_post
  it 'can list all posts of people who have commented on this post' do
    my_comment = create(:comment)
    my_person = create(:person)
    my_post = create(:post)
    my_person.posts << my_post
    my_comment.author = my_person
    this_comment = create(:comment)
    this_person = create(:person)
    this_comment.author = this_person
    this_post = create(:post)
    that_post = create(:post)
    this_person.posts << [this_post, that_post]
    post.comments << [my_comment, this_comment]
    expect(post.comments.author.posts).to include(this_post && that_post && my_post)
  end
end
