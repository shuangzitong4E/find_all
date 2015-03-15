# coding: utf-8
class Connection < ActiveRecord::Base
  belongs_to :interface
  belongs_to :network
  has_many :ips, :dependent => :destroy
  has_one :node , :through => :interface

  # Anscheinend ein Bug, wenn wir die Node dazu nehmen, können wir nicht mehr speichern ?!?
  default_scope{ includes(:interface, :node) }
end
