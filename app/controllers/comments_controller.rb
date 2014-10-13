class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    resource, id = request.path.split('/')[1, 2]
    puts request.path
    @commentable = resource.singularize.classify.constantize.find(id)
    @comment = @commentable.comments.new params.require(:comment).permit(:content).merge(user: current_user)

    if @comment.save
      redirect_to @commentable, notice: '评论成功'
    else
      render :new
    end
  end
  
  def destroy
  end
  
  def update
  end
  


  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :commentable_id)
    end
  
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
