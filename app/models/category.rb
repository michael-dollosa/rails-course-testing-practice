class Category < ApplicationRecord

  validates :name, presence: true, length: {minimum: 3, maximum: 20}
  #unique validation
  validates_uniqueness_of :name

  #has many relationship
  has_many :article_categories
  has_many :articles, through: :article_categories
end