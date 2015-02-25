class CommentsController < ApplicationController

  before_action :if_admin, only: [:new, :edit, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to(:back)
    else
      redirect_to(:back)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(:back)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :article_id, :review_id)
  end

  def if_admin
    if current_user
      if !current_user.admin?
        redirect_to root_path
      end  
    else
      redirect_to root_path
    end     
  end

end
