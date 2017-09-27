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

ActiveRecord::Schema.define(version: 20170926142623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "password_digest"
    t.string "serie"
    t.text "avatar"
    t.bigint "report_id"
    t.bigint "escola_id"
    t.index ["escola_id"], name: "index_alunos_on_escola_id"
    t.index ["report_id"], name: "index_alunos_on_report_id"
  end

  create_table "avisos", force: :cascade do |t|
    t.bigint "image_id"
    t.bigint "escola_id"
    t.index ["escola_id"], name: "index_avisos_on_escola_id"
    t.index ["image_id"], name: "index_avisos_on_image_id"
  end

  create_table "escolas", force: :cascade do |t|
    t.string "nome"
    t.string "cnpj"
    t.string "email"
    t.string "password_digest"
    t.string "unidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "aluno_id"
    t.bigint "aviso_id"
    t.index ["aluno_id"], name: "index_escolas_on_aluno_id"
    t.index ["aviso_id"], name: "index_escolas_on_aviso_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "base64Data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "report_id"
    t.bigint "aviso_id"
    t.index ["aviso_id"], name: "index_images_on_aviso_id"
    t.index ["report_id"], name: "index_images_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "categoria"
    t.string "status"
    t.bigint "escola_id"
    t.bigint "aluno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "descricao"
    t.bigint "image_id"
    t.bigint "video_id"
    t.index ["aluno_id"], name: "index_reports_on_aluno_id"
    t.index ["escola_id"], name: "index_reports_on_escola_id"
    t.index ["image_id"], name: "index_reports_on_image_id"
    t.index ["video_id"], name: "index_reports_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "base64Data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "report_id"
    t.index ["report_id"], name: "index_videos_on_report_id"
  end

  add_foreign_key "alunos", "escolas"
  add_foreign_key "alunos", "reports"
  add_foreign_key "avisos", "escolas"
  add_foreign_key "avisos", "images"
  add_foreign_key "escolas", "alunos"
  add_foreign_key "escolas", "avisos"
  add_foreign_key "images", "avisos"
  add_foreign_key "reports", "images"
  add_foreign_key "reports", "videos"
  add_foreign_key "videos", "reports"
end
