class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def create
    @post = current_or_guest_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "Succesffully created post."
    else
      redirect_to :back, alert: "Failed to create post."
    end
  end

  def destroy
    @post.destroy
    redirect_to request.referrer || root_url
  end

  protected
    def set_post
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:content)
    end
end
