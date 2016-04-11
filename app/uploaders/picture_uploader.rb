# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :standard do
    resize_to_fit 600, 600
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:20",
      width: 400, height: 400, crop: :fill, gravity: :face
  end

end
