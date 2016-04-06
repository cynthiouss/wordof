# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :standard do
    resize_to_fit 600, 600
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:30",
      width: 300, height: 300, crop: :thumb, gravity: :face
  end

end
