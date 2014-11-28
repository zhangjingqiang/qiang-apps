class App < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  
  validates :name, presence: true
  validates :permalink, presence: true, uniqueness: true
  validates :description, presence: true
  validates :url, presence: true
  validates :position, numericality: { greater_than: 0 }
  
  before_validation :set_position
  
  default_scope { order('position DESC') }
  
  scope :by_tag, lambda { |tag_name| joins(:tags).where("tags.name = ?", tag_name) unless tag_name.blank? }
  
  def to_param
    permalink.to_s
  end
  
  attr_accessor :tag_list

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(tags_string)
    tags_string.split(',').each do |tag|
      tag = tag.parameterize
      self.tags << ::Tag.where(name: tag).first_or_create unless self.tags.collect(&:name).include?(tag)
    end
    self.tags
  end

  protected

  def set_position
    if position == 0
      last_position = App.first.try(:position)
      self.position = (last_position.nil? ? 0 : last_position)  + 1
    end
  end
end
