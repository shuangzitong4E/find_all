# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
network = Network.create( :vlan => 100, :description => 'Test', :address => 127001 )
node = Node.create( :name => 'Testnode', :serial => '08154711' )
interface = Interface.create( :node => node, :mac => '00:00:00')
connection = Connection.create(:interface => interface, :network => network )
