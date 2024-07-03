class Customer < ApplicationRecord
  has_many :vehicles, dependent: :destroy

  validates :first_name, :last_name, :email, presence: true
end
