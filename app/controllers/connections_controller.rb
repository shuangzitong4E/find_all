class ConnectionsController < ApplicationController
  active_scaffold :"connection" do |conf|
    conf.columns = [:interface, :network, :ips]
    conf.update.columns = [ :interface, :network, :ips]
    conf.columns[:interface].form_ui = :select
    conf.columns[:interface].actions_for_association_links = [:show]

    conf.subform.columns.add_subgroup 'ips' do |g|
      g.add :ips
    end
  end
end
