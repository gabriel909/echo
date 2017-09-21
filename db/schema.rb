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

ActiveRecord::Schema.define(version: 20170921221846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "serie"
    t.text "avatar"
    t.string "password_digest"
    t.bigint "escola_id"
    t.bigint "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["escola_id"], name: "index_alunos_on_escola_id"
    t.index ["report_id"], name: "index_alunos_on_report_id"
  end

  create_table "avisos", force: :cascade do |t|
    t.string "titulo"
    t.string "descrição"
    t.string "series"
    t.string "imagem"
    t.bigint "escola_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["escola_id"], name: "index_avisos_on_escola_id"
  end

  create_table "escolas", force: :cascade do |t|
    t.string "nome"
    t.string "cnpj"
    t.string "email"
    t.string "password_digest"
    t.string "unidade"
    t.bigint "aviso_id"
    t.bigint "report_id"
    t.bigint "aluno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_escolas_on_aluno_id"
    t.index ["aviso_id"], name: "index_escolas_on_aviso_id"
    t.index ["report_id"], name: "index_escolas_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "categoria"
    t.string "descrição"
    t.string "status"
    t.string "images", default: [], array: true
    t.string "videos", default: [], array: true
    t.bigint "escola_id"
    t.bigint "aluno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_reports_on_aluno_id"
    t.index ["escola_id"], name: "index_reports_on_escola_id"
  end

  add_foreign_key "alunos", "reports"
  add_foreign_key "escolas", "alunos"
  add_foreign_key "escolas", "avisos"
  add_foreign_key "escolas", "reports"
end
