class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  def new
    @comment = Comment.new
  end

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user = current_user


    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    
  end
  def destroy
    
  end
  def update
    
  end
  def index
    
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :micropost_id)
    end
  
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
