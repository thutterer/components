class Component < ActiveRecord::Base
  belongs_to :category
  belongs_to :room
  belongs_to :supplier

  validates :title, presence: {message: :bad_blank}
  validates_numericality_of :quantity, only_integer: true, message: :not_integer
  validates_numericality_of :quantity, greater_than_or_equal_to: 0,
                            message: :negative_number
  validates :category_id, presence: {message: :no_category}
  validates :room_id, presence: {message: :no_room}
  validates :supplier_id, presence: {message: :no_supplier}
end
