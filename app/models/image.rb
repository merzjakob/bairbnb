class Image < ApplicationRecord
  belongs_to :flat
  mount_uploader :photo, PhotoUploader

  validates :photo, presence: true
end
