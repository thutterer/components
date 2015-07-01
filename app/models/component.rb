class Component < ActiveRecord::Base
  belongs_to :category
  belongs_to :room
  belongs_to :supplier

  validates :title, presence: {message: :bad_blank}
  validates :category_id, presence: {message: :no_category}
  validates :room_id, presence: {message: :no_room}
  validates :supplier_id, presence: {message: :no_supplier}
end
