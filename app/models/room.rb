class Room < ActiveRecord::Base
  has_many :components, dependent: :destroy

  validates :title, presence: {message: :bad_blank}
  validates :title, uniqueness: {message: :bad_taken}
end
