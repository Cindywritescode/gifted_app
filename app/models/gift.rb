class Gift < ApplicationRecord
  belongs_to :user
  validates :gift_url, presence: true
end
