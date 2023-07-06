class Image < ApplicationRecord
  belongs_to :video

  validates :path, presence: true
end
