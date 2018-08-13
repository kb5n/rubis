class Section < ApplicationRecord
  belongs_to :article

  enum content_type: {paragraph: 1, image: 2, location: 3, link: 4}

  attachment :image

  validates :description, presence: true, if: :paragraph?
  validates :image, presence: true, if: :image?
  validates :url, presence: true, if: (:link? || :location?)

  before_validation :extract_url_from_tag

  private

  def extract_url_from_tag
    self.url = url.split('"').second if location? && url.starts_with?('<')
  end
end
