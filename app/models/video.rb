class Video < ApplicationRecord
  has_many :images, dependent: :destroy

  validates :title, presence: true
end
