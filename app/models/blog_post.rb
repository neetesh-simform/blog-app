class BlogPost < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :desc_order, -> { order(created_at: :desc) }
  scope :published, -> { where(is_draft: false) }
  scope :draft, -> { where(is_draft: true) }

  after_create :update_publication_at


  self.per_page = 3
  has_rich_text :content

  private

  def update_publication_at
    update_column(:publication_at, DateTime.current)
  end
end
