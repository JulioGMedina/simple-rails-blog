class HomeController < ApplicationController
  def index
    @posts = Post.all
    @post  = current_or_guest_user.posts.build
  end
end
