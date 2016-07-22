class Metadatum < ApplicationRecord
  belongs_to :article, inverse_of: :metadatum
end
