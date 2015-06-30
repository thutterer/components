class Component < ActiveRecord::Base
  belongs_to :category
  belongs_to :room
  belongs_to :supplier

  validates :title, presence: true,
            length: { minimum: 2 }
  validates :category_id, presence: true
  validates :room_id, presence: true
  validates :supplier_id, presence: true
end
