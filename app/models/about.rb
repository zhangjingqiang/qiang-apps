class About < ActiveRecord::Base
  validates_presence_of :title, :description
  validates :title, length: { maximum: 200 }
  validates :description, length: { maximum: 1000 }
end
