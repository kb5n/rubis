class Site < ApplicationRecord
  validates :title, presence: true
  validates :started_at, presence: true
  validates :copyright, presence: true
end
