class Event < ApplicationRecord
  belongs_to :friend
  validates :friend_id, presence: true
  validates :event_type, presence: true
  validate :future_date

  def future_date
    errors.add(:date, "Cannot be in the past") if date < Date.today
  end
end
