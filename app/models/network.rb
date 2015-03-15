class Network < ActiveRecord::Base

  has_many :connections
  has_many :ips, :through => :connections

end
