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

ActiveRecord::Schema.define(version: 20140331075127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
    t.string   "image"
    t.integer  "comments_count",        default: 0, null: false
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "articles", ["cached_votes_down"], name: "index_articles_on_cached_votes_down", using: :btree
  add_index "articles", ["cached_votes_score"], name: "index_articles_on_cached_votes_score", using: :btree
  add_index "articles", ["cached_votes_total"], name: "index_articles_on_cached_votes_total", using: :btree
  add_index "articles", ["cached_votes_up"], name: "index_articles_on_cached_votes_up", using: :btree
  add_index "articles", ["cached_weighted_score"], name: "index_articles_on_cached_weighted_score", using: :btree
  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank"
    t.string   "location"
  end

  create_table "categorizations", force: true do |t|
    t.integer  "lab_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
  add_index "categorizations", ["lab_id"], name: "index_categorizations_on_lab_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
    t.integer  "comments_count",        default: 0, null: false
    t.string   "target"
    t.string   "title"
  end

  add_index "events", ["cached_votes_down"], name: "index_events_on_cached_votes_down", using: :btree
  add_index "events", ["cached_votes_score"], name: "index_events_on_cached_votes_score", using: :btree
  add_index "events", ["cached_votes_total"], name: "index_events_on_cached_votes_total", using: :btree
  add_index "events", ["cached_votes_up"], name: "index_events_on_cached_votes_up", using: :btree
  add_index "events", ["cached_weighted_score"], name: "index_events_on_cached_weighted_score", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "groupings", force: true do |t|
    t.integer  "group_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groupings", ["article_id"], name: "index_groupings_on_article_id", using: :btree
  add_index "groupings", ["group_id"], name: "index_groupings_on_group_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gurus", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "account"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "content"
  end

  add_index "gurus", ["user_id"], name: "index_gurus_on_user_id", using: :btree

  create_table "labs", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "labs", ["user_id"], name: "index_labs_on_user_id", using: :btree

  create_table "papers", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "image"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count",    default: 0, null: false
    t.string   "original_filename"
    t.text     "abstract"
  end

  add_index "papers", ["user_id"], name: "index_papers_on_user_id", using: :btree

  create_table "photos", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "attachable_id"
    t.string   "attachable_type"
  end

  add_index "photos", ["attachable_id", "attachable_type"], name: "index_photos_on_attachable_id_and_attachable_type", using: :btree

  create_table "profiles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
    t.integer  "user_id",    null: false
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "google"
    t.string   "mobile"
    t.string   "url"
    t.text     "lab"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", unique: true, using: :btree

  create_table "programs", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count", default: 0, null: false
    t.integer  "user_id"
  end

  add_index "programs", ["user_id"], name: "index_programs_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
    t.string "level"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "image"
    t.string   "slug"
    t.string   "grade"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
