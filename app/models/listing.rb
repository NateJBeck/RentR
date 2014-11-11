class Listing < ActiveRecord::Base
  NUMBER_OF_IMAGES = 3

  validates :title, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :bedrooms, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images,
    allow_destroy: true,
    reject_if: proc { |attr| attr[:url].blank? }
end
