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

ActiveRecord::Schema.define(version: 2019_12_13_060203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cita", force: :cascade do |t|
    t.datetime "fecha"
    t.bigint "user_id"
    t.bigint "paciente_id"
    t.text "observaciones"
    t.boolean "asistencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "servicio_id"
    t.text "procedimiento"
    t.index ["paciente_id"], name: "index_cita_on_paciente_id"
    t.index ["servicio_id"], name: "index_cita_on_servicio_id"
    t.index ["user_id"], name: "index_cita_on_user_id"
  end

  create_table "especialidads", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.date "fecha_nacimiento"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "genero"
  end

  create_table "servicios", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.string "apellido"
    t.string "especialidad"
    t.string "estado"
    t.bigint "especialidad_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["especialidad_id"], name: "index_users_on_especialidad_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cita", "pacientes"
  add_foreign_key "cita", "servicios"
  add_foreign_key "cita", "users"
  add_foreign_key "users", "especialidads"
end
