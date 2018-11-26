class Booking < ApplicationRecord
  belongs_to :cat
  belongs_to :user
  validates :begin_date, :end_date, presence: true
end
