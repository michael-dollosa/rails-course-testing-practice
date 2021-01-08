class Article < ApplicationRecord
  #association
  belongs_to :user #singular user without 's'

  #many to many relationship
  has_many :article_categories
  has_many :categories, through: :article_categories

  #validating title field
  validates :title, presence: true, :length => { minimum: 6, maximum: 100 } #makes sure that title is present before item is saved with min anx max length
  validates :description, presence: true, length: { minimum: 6, maximum: 300 }

  #notice the difference of syntaxes in setting up validation for length. both are accepted since these are symbol syntax.
  # :length => value or length: value
  # rails convention uses the latter
end
