class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :listings, dependent: :destroy

  has_many :likes
  has_many :liked_listings, through: :likes, source: :listing

  def likes?(listing)
    liked_listings.include?(listing)
  end
end
