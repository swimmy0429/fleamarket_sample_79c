class ItemImage < ApplicationRecord

  mount_uploader :src, ImageUploader
  belongs_to :item

  validates :src, presence: true

  belongs_to :item

end
