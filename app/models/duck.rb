class Duck < ApplicationRecord
  include PgSearch::Model
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
  pg_search_scope :search_by_name_category_description,
    against: [ :name, :category, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :category, :description, :price, :address, presence: true
  # validates :name, uniquenes: { scope: :address,
  #   message: "should not list 2 times the same item" }
end
