class Article < ApplicationRecord
  has_many :comments

  validates :title, presence: true,
                    length: { minimum: 5 }
  scope :last_published, -> { order(created_at: :desc) }
end
