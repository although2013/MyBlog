class AddTagToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :tag, :string, index: true
  end
end
