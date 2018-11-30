class Cat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :photo, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :breed, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than: 0 }
end
