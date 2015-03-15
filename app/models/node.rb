class Node < ActiveRecord::Base

  has_many :interfaces
  has_many :connections, :through => :interfaces
  has_many :ips, :through => :connections

end
