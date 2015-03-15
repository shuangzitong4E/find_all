# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150314044304) do

  create_table "connections", force: :cascade do |t|
    t.integer "interface_id", null: false
    t.integer "network_id",   null: false
  end

  add_index "connections", ["interface_id"], name: "index_connections_on_interface_id"
  add_index "connections", ["network_id"], name: "index_connections_on_network_id"

  create_table "interfaces", force: :cascade do |t|
    t.integer "node_id", null: false
    t.string  "mac"
  end

  add_index "interfaces", ["node_id"], name: "index_interfaces_on_node_id"

  create_table "ips", force: :cascade do |t|
    t.integer "connection_id", null: false
    t.integer "address"
  end

  add_index "ips", ["connection_id"], name: "index_ips_on_connection_id"

  create_table "networks", force: :cascade do |t|
    t.integer "vlan",        null: false
    t.string  "description"
    t.integer "address"
    t.integer "gateway"
  end

  create_table "nodes", force: :cascade do |t|
    t.string  "name",    null: false
    t.string  "serial"
    t.integer "node_id"
  end

  add_index "nodes", ["node_id"], name: "index_nodes_on_node_id"

end
