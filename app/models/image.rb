class Image < ApplicationRecord
  # belongs_to :report
  # belongs_to :aviso
  mount_base64_uploader :image_data, ImageUploader, file_name: -> (i) { i.id }
end
