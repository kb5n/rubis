class Category < ApplicationRecord
  belongs_to :user

  has_many :articles, dependent: :restrict_with_error
  has_many :public_articles, -> { where('articles.status': :published) }, inverse_of: :category, class_name: 'Article'

  validates :name, presence: true
  validates :identifier, presence: true, uniqueness: true, format: /\A[A-Za-z0-9\_]+\Z/
end
