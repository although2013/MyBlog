class Photo < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  validates :picture, presence: true
  default_scope -> { order('created_at DESC') }
  has_many :comments,:as => :commentable, dependent: :destroy
end
