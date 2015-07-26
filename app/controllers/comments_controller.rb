class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = @post.comments.build
  end

   def create
     @comment = @post.comments.build(comment_params)

     if @comment.save
      redirect_to post_path(@post), notice: "oomment posted."
     else
       flash.now[:alert] = "Failed to create post"
       render template: "posts/show"
     end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :parent_id, :pos_id)
  end
end
