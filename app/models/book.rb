class Book < ApplicationRecord
  has_one_attached :media
  belongs_to :user
  has_many :book_comments

  validates :name, presence: true, length: {maximum: 70}
  validates :author, presence: true, length: {minimum: 3, maximum: 60}
  validates :media, presence: true
  validates :editional, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 9999 }
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 101 }
end
