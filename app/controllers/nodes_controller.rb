class NodesController < ApplicationController
  active_scaffold :"node" do |conf|
    conf.update.columns = [:name, :serial, :interfaces, :parent  ]
    conf.update.hide_nested_column = :false
    conf.create.columns = conf.update.columns

    conf.columns[:parent].form_ui = :select
    conf.columns[:parent].actions_for_association_links = [:show]
  end
end
