class Event < ApplicationRecord
  belongs_to :friend
  validates :event_type, presence: true
  validates :date, presence: true

  def future_date
    errors.add(:date, "Cannot be in the past") if date < Date.today
  end
end
