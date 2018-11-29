class Review < ApplicationRecord
  belongs_to :booking

  validates :description, presence: true
  validates :rating,
            presence: true,
            numericality: { only_integer: true },
            inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :booking_id, uniqueness: { scope: :user_id }
end
