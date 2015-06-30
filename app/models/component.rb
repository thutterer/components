class Component < ActiveRecord::Base
  belongs_to :category
  belongs_to :room

  validates :title, presence: true,
            length: { minimum: 2 }
  validates :category_id, presence: true
  validates :room_id, presence: true
end
