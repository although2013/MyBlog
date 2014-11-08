class AddCommentsCountToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :comments_count, :integer, default: 0
  end
end
