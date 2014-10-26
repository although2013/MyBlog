class MicropostsController < ApplicationController

  before_action :set_micropost, only: [:show, :edit, :update, :destroy]
  before_action :admin_require, only: [:new, :create, :edit, :update, :destroy]
  def index
    @microposts = Micropost.paginate(page: params[:page]).per_page(15)
  end


  def show
    @micropost = Micropost.find(params[:id])
    @comments = @micropost.comments.includes(:user).all
    @comment = Comment.new
  end


  def new
    @micropost = Micropost.new
  end


  def edit
  end


  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      flash[:success] = '微博发送成功'
      redirect_to @micropost
    else
      flash.now[:danger] = '微博发送失败'
      render 'new'
    end
  end


  def update
    if @micropost.update(micropost_params)
      flash[:success] = '微博修改成功'
      redirect_to @micropost
    else
      flash.now[:danger] = '微博修改失败'
      render 'new'
    end
  end


  def destroy
    if @micropost.destroy
      redirect_to microposts_url
    end
  end

  private
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end

end
