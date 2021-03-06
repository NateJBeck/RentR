class Listing < ActiveRecord::Base
  NUMBER_OF_IMAGES = 3

  validates :address, presence: true
  validates :bedrooms, presence: true
  validates :description, presence: true
  validates :ends_on, presence: true
  validates :location, presence: true
  validates :max_guest_number, presence: true
  validates :price, presence: true
  validates :starts_on, presence: true
  validates :title, presence: true

  belongs_to :user

  has_many :images, dependent: :destroy
  has_many :likes
  has_many :booking_requests

  accepts_nested_attributes_for :images,
    allow_destroy: true,
    reject_if: proc { |attr| attr[:url].blank? }
end
