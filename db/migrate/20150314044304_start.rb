# coding: utf-8
class Start < ActiveRecord::Migration
  def change

    create_table :nodes, :comment => "Netzaktive Komponenten wie Server (virtuell/physisch) und Switche" do |nodes|
      nodes.string       :name, :null => false, :comment => "Systemname"
      nodes.string       :serial, :comment => "Seriennummer"

      nodes.references   :node, :comment => "Selbstreferenz, um die Beziehung 1 Cluster -< n Nodes abzubilden", :index => true
    end

    add_foreign_key :nodes, :nodes, :on_delete => :restrict

    create_table :interfaces, :comment => "Netzwerkinterface einer Node" do |interfaces|
      interfaces.references :node, :null => false, :comment => "Node, zu dem das Interface gehoert", :index => true
      interfaces.string     :mac, :comment => "MAC des Interfaces"
    end

    add_foreign_key :interfaces, :nodes, :on_delete => :cascade

    create_table :networks, :comment => "Auflistung der VLANs mit ihren spezifische Informationen" do |networks|
      networks.integer    :vlan, :null => false, :comment => "VLAN-Nummer"
      networks.string     :description, :comment => "VLAN-Beschreibung"
      networks.integer    :address, :comment => "Erste Adresse des Netzwerks"
      networks.integer    :gateway, :comment => "Default-GW des Netzes"
    end

    create_table :connections, :comment => "Eine Connection ist die Verbindung von einem VLAN mit einem Interface" do |connections|
      connections.references :interface, :null => false, :index => true
      connections.references :network, :null => false, :index => true
    end

    add_foreign_key :connections, :interfaces, :on_delete => :cascade
    add_foreign_key :connections, :networks, :on_delete => :cascade

    create_table :ips, :comment => "IP-Adressen eines Interfaces" do |ips|
      ips.references :connection, :null => false, :comment => "Verbindung, zu der die IP konfiguriert sein soll", :index => true
      ips.integer    :address, :comment => "IP-Adresse", :unique => true
    end

    add_foreign_key :ips, :connections, :on_delete => :cascade

  end
    
end
