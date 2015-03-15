class Ip < ActiveRecord::Base

  belongs_to :connection
  has_one :network, :through => :connection
  has_one :interface, :through => :connection
  has_one :node , :through => :interface

end
