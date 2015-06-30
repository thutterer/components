class ComponentAttributeValue < ActiveRecord::Base
  belongs_to :component
  belongs_to :addribude, class_name: "Attribute"
end
