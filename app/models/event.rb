class Event < ApplicationRecord
  belongs_to :friend, dependent: :destroy
  validates :friend_id, presence: true
  validates :event_type, presence: true
  # validates :future_date, presence: true

  def future_date
    errors.add(:date, "Cannot be in the past") if date < Date.today
  end
end
