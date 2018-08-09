class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :articles, dependent: :destroy

  enum role_type: %i[guest admin]

  validates :name, presence: true
  validates :identifier, presence: true, uniqueness: true, format: /\A[A-Za-z0-9\_]+\Z/
  validates :email, presence: true, uniqueness: true, format: /\A(.)+@(.)+\Z/
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :blog_title, presence: true
  validates :blog_started_at, presence: true
end
