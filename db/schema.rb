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

ActiveRecord::Schema[7.0].define(version: 2023_04_16_153432) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collection_points", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "contact"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collection_points_recyclable_materials", id: false, force: :cascade do |t|
    t.bigint "collection_point_id", null: false
    t.bigint "recyclable_material_id", null: false
    t.index ["collection_point_id"], name: "cp_rm_cp_id_idx"
    t.index ["recyclable_material_id"], name: "cp_rm_rm_id_idx"
  end

  create_table "recyclable_materials", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
