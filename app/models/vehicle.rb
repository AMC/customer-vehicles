class Vehicle < ApplicationRecord
  belongs_to :customer

  before_save :normalize_category

  validates :category, :name, :length, presence: true

  private

  # length does not need to be normalize because .to_i will convert it to an integer to match the database schema
  def normalize_category
    self.category = category.downcase
  end
end
