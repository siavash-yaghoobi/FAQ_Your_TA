class Booking < ApplicationRecord
  belongs_to :Duck
  belongs_to :User
end
