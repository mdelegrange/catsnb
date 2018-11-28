class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader

  # as renter
  has_many :bookings

  # as owner
  has_many :cats, dependent: :destroy
  has_many :received_bookings, through: :cats, source: :bookings

  validates :first_name, :last_name, presence: true
  validates :sex, inclusion: { in: ['M', 'F'] }
end
