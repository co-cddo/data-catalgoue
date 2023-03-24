# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_24_122753) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "creations", id: false, force: :cascade do |t|
    t.uuid "organisation_id", null: false
    t.uuid "data_resource_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_resource_id"], name: "index_creations_on_data_resource_id"
    t.index ["organisation_id", "data_resource_id"], name: "index_creations_on_organisation_id_and_data_resource_id", unique: true
    t.index ["organisation_id"], name: "index_creations_on_organisation_id"
  end

  create_table "data_resources", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "alternative_titles", default: [], array: true
    t.text "contact_name"
    t.text "contact_email"
    t.text "description"
    t.text "identifier"
    t.text "keywords", default: [], array: true
    t.text "licence"
    t.text "summary"
    t.text "themes", default: [], array: true
    t.text "title"
    t.text "version"
    t.integer "access_rights"
    t.integer "security_classification"
    t.date "issued"
    t.datetime "created"
    t.datetime "modified"
    t.string "resourceable_type", null: false
    t.uuid "resourceable_id", null: false
    t.uuid "publisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_id"], name: "index_data_resources_on_publisher_id"
    t.index ["resourceable_type", "resourceable_id"], name: "index_data_resources_on_resourceable"
  end

  create_table "data_services", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "url"
    t.text "contact"
    t.text "documentation_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "organisation_id"
    t.uuid "source_id"
    t.text "endpoint_url"
    t.text "endpoint_description"
    t.text "serves_data", default: [], array: true
    t.integer "service_type"
    t.integer "service_status"
    t.index ["organisation_id"], name: "index_data_services_on_organisation_id"
    t.index ["source_id"], name: "index_data_services_on_source_id"
  end

  create_table "datasets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organisations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.index ["slug"], name: "index_organisations_on_slug", unique: true
  end

  create_table "related_resources", id: false, force: :cascade do |t|
    t.uuid "data_resource_id", null: false
    t.uuid "related_data_resource_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_resource_id", "related_data_resource_id"], name: "index_on_data_resource_id_and_related_data_resource_id", unique: true
    t.index ["data_resource_id"], name: "index_related_resources_on_data_resource_id"
    t.index ["related_data_resource_id"], name: "index_related_resources_on_related_data_resource_id"
  end

  create_table "sources", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "name", null: false
    t.text "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true, null: false
    t.integer "kind", default: 0, null: false
    t.index ["active"], name: "index_sources_on_active"
    t.index ["url"], name: "index_sources_on_url", unique: true
  end

  add_foreign_key "data_resources", "organisations", column: "publisher_id"
  add_foreign_key "data_services", "organisations"
end
