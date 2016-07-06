class Post < ApplicationRecord
  validates :title, presence: true
  # validate_precense_of :title, :body
end
