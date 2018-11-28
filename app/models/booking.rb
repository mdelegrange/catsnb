class Booking < ApplicationRecord
  belongs_to :cat
  belongs_to :user

  validates :status, inclusion: { in: ['pending', 'accepted', 'denied'] }
  validates :begin_date, presence: true
  validates :end_date, presence: true
  validate :end_after_start

  private

  def end_after_start
    return if end_date.blank? || begin_date.blank?

      if end_date < begin_date
        errors.add(:end_date, "must be after the begin date")
      end
   end
end
