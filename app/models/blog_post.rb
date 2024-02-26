class BlogPost < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :desc_order, -> { order(created_at: :desc) }

  self.per_page = 3
end
