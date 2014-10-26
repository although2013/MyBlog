class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :edit_avatar, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_require, only: [:index, :destroy]


  def index
    @users = User.all
  end

  def show

  end


  def new
    @user = User.new
  end


  def edit
  end


  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      flash[:success] = "注册成功！"
      redirect_to @user
    else
      flash[:danger] = "注册失败！"
      render 'new'
    end
  end


  def update
    if @user.update_attributes(user_params)
      flash[:success] = "修改成功！"
      redirect_to @user
    else
      flash[:danger] = "修改失败！"
      render 'edit'
    end
  end

  def edit_avatar
    
  end



  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end  
end
