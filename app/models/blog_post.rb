class BlogPost < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user

  scope :desc_order, -> { order(created_at: :desc) }
end
