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

ActiveRecord::Schema.define(version: 20160623192610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itens_orientacao", force: :cascade do |t|
    t.string   "nome",                   null: false
    t.integer  "id_item_orientacao_sup"
    t.integer  "id_orientacao"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "itens_receita", force: :cascade do |t|
    t.integer  "id_receita",        null: false
    t.integer  "id_medicamento",    null: false
    t.integer  "id_unidade_medida", null: false
    t.integer  "quantidade",        null: false
    t.string   "instrucoes_uso"
    t.string   "sugestao_horario"
    t.boolean  "pagina_separada"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "medicamentos", force: :cascade do |t|
    t.string   "nome",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orientacoes", force: :cascade do |t|
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

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "itens_orientacao", "itens_orientacao", column: "id_item_orientacao_sup"
  add_foreign_key "itens_orientacao", "orientacoes", column: "id_orientacao"
  add_foreign_key "itens_receita", "medicamentos", column: "id_medicamento"
  add_foreign_key "itens_receita", "receitas", column: "id_receita"
  add_foreign_key "itens_receita", "unidades_medida", column: "id_unidade_medida"
end
