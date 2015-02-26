class CommentsController < ApplicationController

  before_action :if_admin, only: [:new, :edit]
  add_breadcrumb "Home", :root_path

  def new
    @comment = Comment.new
  end

  def comments_list

    if params[:article_id]
      @comments = Comment.ransack(article_id_eq: params[:id]).result
    end  

    if params[:review_id] 
      @comments = Comment.ransack(review_id_eq: params[:id]).result
    end  

    @comments = @comments.paginate(:page => params[:page], :per_page => 20)
    add_breadcrumb "Comments"
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
