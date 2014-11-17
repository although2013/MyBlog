class PhotosController < ApplicationController
  before_action :admin_require, only: [:new, :create, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end


  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = '图片上传成功'
      redirect_to @photo
    else
      flash.now[:danger] = '图片上传失败'
      render 'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      redirect_to photos_url
    else
      redirect_to root_url
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:name, :picture)
  end
  
end
