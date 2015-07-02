class Room < ActiveRecord::Base
  has_many :components, dependent: :destroy

  validates :title, presence: {message: :bad_blank}
  validates :title, uniqueness: {message: :bad_taken}


  # TODO http://stackoverflow.com/a/9172936
  def self.search_title(query)
    where("title like ?", "%#{query}%")
  end
end
