class Category < ApplicationRecord

  validates :name, presence: true, length: {minimum: 3, maximum: 20}
  #unique validation
  validates_uniqueness_of :name
end