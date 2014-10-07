# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/pictures/"
  end


  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [300, 300]
  end

  version :detail  do
    process :big_image_detail
  end

  def big_image_detail
    manipulate! do |img|
      if img.columns > img.rows
        if img.columns > 900
          i = img.columns / 800
          img.resize_to_fill! img.columns/i, img.rows/i
        end
      else
        if img.rows >= 700
          i = img.rows / 600
          img.resize_to_fill! img.columns/i, img.rows/i
        end
      end
    end
  end

  
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # def filename
  #   "something.jpg" if original_filename
  # end


end
