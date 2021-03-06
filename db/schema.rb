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

ActiveRecord::Schema.define(version: 20141011044854) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "index"
    t.string   "create"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "breeds", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "Family_id"
  end

  add_index "breeds", ["Family_id"], name: "index_breeds_on_Family_id"

  create_table "families", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pets", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.integer  "family_id"
    t.integer  "breed_id"
    t.string   "otherDetails"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "age"
    t.integer  "user_id"
  end

  add_index "pets", ["breed_id"], name: "index_pets_on_breed_id"
  add_index "pets", ["family_id"], name: "index_pets_on_family_id"
  add_index "pets", ["user_id"], name: "index_pets_on_user_id"

  create_table "request_details", force: true do |t|
    t.integer  "request_id"
    t.integer  "service_id"
    t.integer  "pet_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "request_details", ["pet_id"], name: "index_request_details_on_pet_id"
  add_index "request_details", ["request_id"], name: "index_request_details_on_request_id"
  add_index "request_details", ["service_id"], name: "index_request_details_on_service_id"

  create_table "requests", force: true do |t|
    t.date     "requestDate"
    t.integer  "serviceType_id"
    t.string   "address"
    t.date     "proposeDate"
    t.time     "proposeHour"
    t.boolean  "isPending"
    t.boolean  "isConfirmed"
    t.string   "comment"
    t.integer  "vet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "requests", ["serviceType_id"], name: "index_requests_on_serviceType_id"
  add_index "requests", ["user_id"], name: "index_requests_on_user_id"
  add_index "requests", ["vet_id"], name: "index_requests_on_vet_id"

  create_table "service_types", force: true do |t|
    t.boolean  "atHome"
    t.boolean  "inSite"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lugar"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vet_id"
  end

  add_index "services", ["vet_id"], name: "index_services_on_vet_id"

  create_table "species", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "lastName"
    t.string   "address"
    t.string   "phone"
    t.string   "mobilePhone"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vets", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "address"
    t.string   "logo"
    t.string   "phone"
    t.string   "url"
  end

  add_index "vets", ["email"], name: "index_vets_on_email", unique: true
  add_index "vets", ["reset_password_token"], name: "index_vets_on_reset_password_token", unique: true

end
