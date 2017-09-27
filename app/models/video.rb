class Video < ApplicationRecord
  belongs_to :report
  mount_base64_uploader :video_data, ImageUploader
end
