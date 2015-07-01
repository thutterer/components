class Room < ActiveRecord::Base
  validates :title, presence: {message: :bad_blank}
  validates :title, uniqueness: {message: :bad_taken}
end
