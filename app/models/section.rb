class Section < ApplicationRecord
  belongs_to :article

  enum content_type: %i[paragraph figure location link]
end
