class IpsController < ApplicationController
  active_scaffold :"ip" do |conf|
    conf.columns = [:address, :connection ]
    conf.columns[:connection].form_ui = :select
    conf.columns[:connection].actions_for_association_links = [:show]
    conf.columns[:connection].update_columns = :address
    conf.columns[:connection].send_form_on_update_column = true
  end
end
