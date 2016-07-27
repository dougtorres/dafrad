class Comment < ApplicationRecord
  belongs_to :article, inverse_of: :comments
end
