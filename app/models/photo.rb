class Photo < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  has_many :comments,:as => :commentable, dependent: :destroy
end
