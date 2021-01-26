class Soinvisage < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_rich_text :rich_content
  validates :name, presence: true, uniqueness: true
end
