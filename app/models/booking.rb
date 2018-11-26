class Booking < ApplicationRecord
  belongs_to :cat
  belongs_to :user
  validates :begin_date, presence: true
  validates :end_date, presence: true
end
