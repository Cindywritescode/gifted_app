class Friend < ApplicationRecord
  belongs_to :user
  has_many :gift_ideas, dependent: :destroy
  has_many :gifts, through: :gift_ideas, dependent: :destroy

  validates :name, presence: true
end
