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

ActiveRecord::Schema.define(version: 20170713192643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "recommendations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "phone_extension"
    t.string "fax_number"
    t.string "organization"
    t.string "position"
    t.string "subject"
    t.text "body"
    t.string "signature_id"
    t.integer "signature_status"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "address_city"
    t.string "address_state"
    t.string "address_zip"
    t.string "address_country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
