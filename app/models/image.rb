class Image < ApplicationRecord
  belongs_to :report
  mount_base64_uploader :base64Data, ImageUploader, file_name: -> (i) { i.id }
end
