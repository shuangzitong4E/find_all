class InterfacesController < ApplicationController
  active_scaffold :"interface" do |conf|
    conf.columns = [:node, :mac, :connections, :ips]
    conf.update.columns = [ :node, :mac, :connections ]
    conf.columns[:node].form_ui = :select
    conf.columns[:node].actions_for_association_links = [:show]

    conf.subform.columns.add_subgroup 'connections' do |g|
      g.add :connections
    end
  end
end
