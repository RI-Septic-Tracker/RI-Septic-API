# frozen_string_literal: true
# rubocop:disable all
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

ActiveRecord::Schema.define(version: 20_220_610_200_201) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'properties', force: :cascade do |t|
    t.string 'city'
    t.string 'street'
    t.integer 'num'
    t.integer 'bedrooms'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'test_holes', force: :cascade do |t|
    t.bigint 'property_id'
    t.integer 'shwt'
    t.integer 'ledge_depth'
    t.string 'notes'
    t.boolean 'inspector_present'
    t.datetime 'date'
    t.float 'load_rate'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['property_id'], name: 'index_test_holes_on_property_id'
  end

  create_table 'user_test_holes', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'test_hole_id'
    t.index ['test_hole_id'], name: 'index_user_test_holes_on_test_hole_id'
    t.index ['user_id'], name: 'index_user_test_holes_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'city'
    t.string 'address'
    t.string 'phone'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'inspector'
    t.string 'name'
  end

  add_foreign_key 'test_holes', 'properties'
  add_foreign_key 'user_test_holes', 'test_holes'
  add_foreign_key 'user_test_holes', 'users'
end
