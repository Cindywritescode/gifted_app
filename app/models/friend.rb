class Friend < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :gift_ideas, dependent: :destroy
  has_many :gifts, through: :gift_ideas
  has_many :notes, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_friend_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } 
    }
end
