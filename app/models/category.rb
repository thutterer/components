class Category < ActiveRecord::Base
  has_many :components, dependent: :destroy
  #has_and_belongs_to_many :attributes didn't work because ActiveRecord already has a private method named attributes!
  has_and_belongs_to_many :addribude, class_name: "Attribute"

  validates :title, presence: true
end
