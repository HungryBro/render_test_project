class Chapter < ApplicationRecord
  belongs_to :novel
  has_rich_text :content
  validates :title, :content, presence: true
end
