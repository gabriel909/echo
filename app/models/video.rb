class Video < ApplicationRecord
  belongs_to :report

  mount_base64_uploader :base64Data, ImageUploader
end
