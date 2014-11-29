class Notice < ActiveRecord::Base
  validates_presence_of :title, :body
  validates :title, length: { maximum: 200 }
  validates :body, length: { maximum: 1000 }
end
