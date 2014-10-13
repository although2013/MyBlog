class Micropost < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  has_many :comments,:as => :commentable, dependent: :destroy
end
