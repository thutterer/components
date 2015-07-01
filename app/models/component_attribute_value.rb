class ComponentAttributeValue < ActiveRecord::Base
  belongs_to :component
  belongs_to :addribude, class_name: "Attribute"

  validates :component_id, presence: true
  validates :attribute_id, presence: true
end
