# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base


  include CarrierWave::RMagick

  storage :file


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :small do
    process :crop
    process :resize_to_fill => [45, 45]
  end

  version :big do
    process :crop
    process :resize_to_fill => [240, 240]
  end

  version :not_edit do
    resize_to_limit(500,500)
  end

  def crop
    if model.crop_x.present?
      manipulate! do |img|
        resize_to_limit(500,500)
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop!(x,y,w,h)
      end
    end
  end


  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
