class ArticleCategory < ApplicationRecord
  #this is a lookup table for article-category many - to - many rel
  belongs_to :article_id
  belongs_to :category_id
end