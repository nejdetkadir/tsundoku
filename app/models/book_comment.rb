class BookComment < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :comment, presence: true, length: {minimum: 5, maximum: 250}
end
