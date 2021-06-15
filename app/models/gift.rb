class Gift < ApplicationRecord
  belongs_to :user
  has_many :gift_ideas, dependent: :destroy
  has_many :friends, through: :gift_ideas
  validates :gift_url, presence: true

    include PgSearch::Model
  pg_search_scope :search_by_product_name,
    against: [ :product_name],
    using: {
      tsearch: { prefix: true }
    }
end
