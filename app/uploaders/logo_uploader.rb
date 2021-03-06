# encoding: utf-8
# require 'carrierwave/processing/rmagick'

class LogoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  SIZES = {
    thumb: [100, 100],
    small: [180, 180],
    medium: [250, 250],
    large: [600, 600]
  }

  # Choose what kind of storage to use for this uploader:
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  def convert_to_grayscale
    manipulate! do |img|
      img.colorspace("Gray")
      img.brightness_contrast("-30x0")
      img = yield(img) if block_given?
      img
    end
  end

  def invert
    manipulate! do |img|
      img.negate
      img
    end
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => SIZES[:thumb]
  end

  version :small do
    process :resize_to_fit => SIZES[:small]
  end

  version :small_inverted do
    process :convert_to_grayscale,
            :invert,
            :resize_to_fit => SIZES[:small]
  end

  version :medium do
    process :resize_to_fit => SIZES[:medium]
  end

  version :medium_inverted do
    process :convert_to_grayscale,
            :invert,
            :resize_to_fit => SIZES[:medium]
  end

  version :large do
    process :resize_to_fit => SIZES[:large]
  end

  version :large_inverted do
    process :convert_to_grayscale,
            :invert,
            :resize_to_fit => SIZES[:large]
  end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
