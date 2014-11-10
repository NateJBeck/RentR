class Listing < ActiveRecord::Base
  validates :title, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :bedrooms, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
  validates :description, presence: true

  belongs_to :user
end
