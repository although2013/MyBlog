# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base


  include CarrierWave::RMagick

  storage :file


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :small do
    process :resize_to_fill => [45, 45]
  end

  version :big do
    process :resize_to_fill => [240, 240]
  end

  version :not_edit do
    process :edit_avatar
  end

  def edit_avatar
    manipulate! do |img|
      if img.columns > img.rows/2.2
        if img.columns > img.rows
          if img.columns > 700
            i = img.columns / 500
            img.resize_to_fill! img.columns/i, img.rows/i
          else
            img
          end
        else
          if img.rows >= 550
            i = img.rows / 350
            img.resize_to_fill! img.columns/i, img.rows/i
          else
            img
          end
        end
      else
        img
      end
    end
  end


  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
