class Booking < ApplicationRecord
  belongs_to :cat
  belongs_to :user

  validates :status, inclusion: { in: ['inprogress', 'accepted', 'denied'] }
  validates :begin_date, presence: true
  validates :end_date, presence: true
end
