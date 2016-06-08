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

ActiveRecord::Schema.define(version: 20160608002406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itens", force: :cascade do |t|
    t.integer  "receita_id",        null: false
    t.integer  "medicamento_id",    null: false
    t.integer  "unidade_medida_id", null: false
    t.integer  "quantidade",        null: false
    t.string   "instrucoes_de_uso"
    t.string   "sugestao_horario"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "medicamentos", force: :cascade do |t|
    t.string   "nome",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receitas", force: :cascade do |t|
    t.string   "nome",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidades_medida", force: :cascade do |t|
    t.string   "nome",       null: false
    t.string   "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "itens", "medicamentos"
  add_foreign_key "itens", "receitas"
  add_foreign_key "itens", "unidades_medida"
end
