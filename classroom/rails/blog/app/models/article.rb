class Article < ApplicationRecord
  has_many :comments, inverse_of: :article
  has_one :metadatum, inverse_of: :article
  has_and_belongs_to_many :tags
  scope :last_month, -> {
    where(created_at: (Time.now - 30.day)..Time.now)
  }
end
