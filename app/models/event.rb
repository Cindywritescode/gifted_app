class Event < ApplicationRecord
  belongs_to :friend
  belongs_to :user
  validates :friend_id, presence: true
  validates :event_type, presence: true
  validate :future_date

  TYPES = ['Birthday', 'Friendaversary', 'Divorce Party', 'Graduation', 'Baby Shower', 'Wedding', 'Anniversary']

  validates :event_type, inclusion: { in: TYPES,
    message: "%{value} is not a valid event type" }

  # after_commit :async_update # Run on create & update

  private

  # after_commit :async_update # Run on create & update

  private

  def future_date
    errors.add(:date, "Cannot be in the past") if date < Date.today
  end

  # def async_update
  #   send_date = self.date - 14.days
  #   EventMailJob.set(wait_until: Date.tomorrow.noon).perform_later(self)
  #   # EventMailJob.perform_later(self)
  #   # EventMailJob.perform_at(self.date - 2.week, self)
  # end
end
