class Client < ActiveRecord::Base
  attr_accessible :name, :telephone

  validates_presence_of :name

  has_one :brand

  scope :sorted_by_name, order("name asc")

end
