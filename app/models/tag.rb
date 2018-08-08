class Tag < ApplicationRecord
  belongs_to :user

  has_many :article_tags, dependent: :destroy
  has_many :articles, through: :article_tags
  has_many :public_articles, -> { where('articles.status': :published) }, through: :article_tags, source: :article

  validates :name, presence: true
  validates :identifier, presence: true, uniqueness: true, format: /\A[A-Za-z0-9\_]+\Z/
end
