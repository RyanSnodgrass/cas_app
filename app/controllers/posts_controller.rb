class PostsController < ApplicationController
  before_action :authenticate
  def index
    @posts = Post.all
  end

end