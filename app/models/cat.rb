class Cat < ApplicationRecord
    mount_uploader :photo, PhotoUploader
    belongs_to :user
    has_many :bookings
    validates :name, :photo, :description, :breed, :price_per_day, presence: true
end
