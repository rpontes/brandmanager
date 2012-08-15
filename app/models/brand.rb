class Brand < ActiveRecord::Base
  attr_accessible :number_process, :name, :procedure, :date_rpi, :date_company, :deadline, :completed

  validates_presence_of :number_process, 
                        :name, 
                        :procedure, 
                        :date_rpi, 
                        :date_company, 
                        :deadline, 
                        :completed

  belongs_to :user
  belongs_to :client

  scope :recent, order("id desc")

end
