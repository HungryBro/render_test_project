class Chapter < ApplicationRecord
  belongs_to :novel
  validates :title, :content, presence: true
end
