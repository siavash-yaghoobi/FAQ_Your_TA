class Duck < ApplicationRecord
  include PgSearch::Model
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
  pg_search_scope :search_by_name_category_description,
    against: [ :name, :category, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
