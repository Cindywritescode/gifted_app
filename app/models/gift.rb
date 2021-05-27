class Gift < ApplicationRecord
  belongs_to :user
  has_many :gift_ideas, dependent: :destroy
  has_many :friends, through: :gift_ideas
  validates :gift_url, presence: true
end
