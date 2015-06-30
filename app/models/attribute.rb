class Attribute < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many  :components, through: :component_attribute_values

  validates :title, presence: true
end
