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

ActiveRecord::Schema.define(version: 20171015153727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "day_statistics", force: :cascade do |t|
    t.integer "left_ventrical_function", default: 0
    t.integer "heart_rate", default: 0
    t.integer "breath_rate", default: 0
    t.decimal "leucocytes_count", default: "0.0"
    t.integer "systalic_ad", default: 0
    t.integer "denver_pao2_fio2", default: 0
    t.decimal "denver_creatinine", default: "0.0"
    t.decimal "bilirubin", default: "0.0"
    t.integer "dopamine"
    t.integer "dobutamine"
    t.integer "epinephrine"
    t.integer "norepinephrine"
    t.integer "glasgow_coma", default: 0
    t.boolean "is_pupillary_reaction", default: true
    t.decimal "lactatemia", default: "0.0"
    t.integer "pelod_mean_ad", default: 0
    t.integer "pelod_creatinine", default: 0
    t.integer "pelod_pao2_fio2", default: 0
    t.integer "paco2", default: 0
    t.boolean "is_invasive_ventilation", default: false
    t.integer "trombocit_count", default: 0
    t.integer "spo2_fio2", default: 0
    t.bigint "patient_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_day_statistics_on_patient_id"
    t.index ["user_id"], name: "index_day_statistics_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name", default: ""
    t.integer "age_type", default: 0
    t.text "clinic_diagnosis", default: ""
    t.date "intrance_date"
    t.date "research_date"
    t.boolean "is_infection", default: false
    t.string "infection_localization", default: ""
    t.string "identified_pathogen", default: ""
    t.date "pathogen_date"
    t.text "antibacterial_therapy", default: ""
    t.integer "start_time_antibacterial_therapy", default: 0
    t.integer "volume_start_infusion", default: 0
    t.string "start_infusion_solution", default: ""
    t.boolean "is_ivl", default: false
    t.integer "ivl_time", default: 0
    t.boolean "is_sepsis", default: false
    t.date "sespsis_date"
    t.boolean "is_renal_therapy", default: false
    t.string "renal_therapy", default: ""
    t.boolean "is_operation", default: false
    t.text "final_diagnosis", default: ""
    t.boolean "is_alive", default: true
    t.integer "death_count_days", default: 0
    t.integer "reanimation_count_days", default: 0
    t.integer "hospital_count_days", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "irk", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "day_statistics", "patients"
  add_foreign_key "day_statistics", "users"
  add_foreign_key "patients", "users"
end
