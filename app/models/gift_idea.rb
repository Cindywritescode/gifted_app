class GiftIdea < ApplicationRecord
  belongs_to :friend
  belongs_to :gift, dependent: :destroy
end
