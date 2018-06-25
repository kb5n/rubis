class Category < ApplicationRecord
  validates :name, presence: true
  validates :identifier, presence: true, uniqueness: true, format: /\A[A-Za-z0-9\_]+\Z/
end
