class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :subject, :message
  validates :name, length: { maximum: 200 }
  validates :email, length: { maximum: 200 }
  validates :subject, length: { maximum: 200 }
  validates :message, length: { maximum: 1000 }
  
  default_scope { order('id DESC') }
end
