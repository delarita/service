class Soinvisage < ApplicationRecord
  belongs_to :user
  include Orderitemable
  has_one_attached :photo
  has_rich_text :rich_content
  monetize :price_cents
  validates :name, presence: true, uniqueness: true
end
