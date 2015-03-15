class NetworksController < ApplicationController
  active_scaffold :"network" do |conf|
        #    conf.columns = [:vlan, :address, :description, :ips, :ipranges]
    conf.columns = [:vlan, :address, :description, :ips]
    conf.columns[:ips].form_ui = :select
    conf.columns[:ips].actions_for_association_links = [:show]

    conf.update.columns = [:vlan, :address, :description, :ipranges]
    

  end
end
