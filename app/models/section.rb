class Section < ApplicationRecord
  belongs_to :article

  enum content_type: %i[paragraph image location link]

  validates :description, presence: true, if: :paragraph?
  validates :image_url, presence: true, if: :image?
  validates :url, presence: true, if: (:link? or :location?)
end
