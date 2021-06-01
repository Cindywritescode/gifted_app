class Event < ApplicationRecord
  belongs_to :friend
  validates :friend_id, presence: true
  validates :event_type, presence: true
  validate :future_date
  
  TYPES = ['birthday', 'friendaversary', 'divorce party', 'graduation', 'baby shower', 'wedding']

  
  validates :event_type, inclusion: { in: TYPES,
    messae: "%{value} is not a valid event type" }

  def future_date
    errors.add(:date, "Cannot be in the past") if date < Date.today
  end
end
