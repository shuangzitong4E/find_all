class Interface < ActiveRecord::Base

  belongs_to :node
  has_many :connections
  has_many :ips, :through => :connections

end
