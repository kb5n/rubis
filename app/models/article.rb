class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :sections, -> { order(:sequence) }, inverse_of: :article, dependent: :destroy
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags

  enum status: { draft: 0, published: 1 }

  validates :title, presence: true
  validates :identifier, presence: true, uniqueness: true, format: /\A[A-Za-z0-9\_]+\Z/
  validates :published_at, presence: true

  scope :opened, -> { where(status: Article.statuses[:published]).where('published_at <= ?', Time.current) }
end
