class InitSchema < ActiveRecord::Migration[7.1]
  def up
    create_table "active_storage_attachments" do |t|
      t.string "name", null: false
      t.string "record_type", null: false
      t.bigint "record_id", null: false
      t.bigint "blob_id", null: false
      t.datetime "created_at", null: false
      t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
      t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    end
    create_table "active_storage_blobs" do |t|
      t.string "key", null: false
      t.string "filename", null: false
      t.string "content_type"
      t.text "metadata"
      t.string "service_name", null: false
      t.bigint "byte_size", null: false
      t.string "checksum"
      t.datetime "created_at", null: false
      t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
    end
    create_table "active_storage_variant_records" do |t|
      t.bigint "blob_id", null: false
      t.string "variation_digest", null: false
      t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
    end
    create_table "consults" do |t|
      t.text "description"
      t.integer "patient_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["patient_id"], name: "index_consults_on_patient_id"
    end
    create_table "patients" do |t|
      t.string "name"
      t.string "lastname"
      t.integer "dni"
      t.date "birth_date"
      t.integer "children"
      t.string "partner"
      t.string "parents"
      t.string "siblings"
      t.string "address"
      t.string "phone"
      t.text "family_history"
      t.text "personal_history"
      t.string "occupation"
      t.string "diet"
      t.string "exercise"
      t.string "substance_use"
      t.string "sexual_activity"
      t.string "consult_record"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "status", default: 0
    end
    create_table "users" do |t|
      t.string "username", default: "", null: false
      t.string "password_digest", default: "", null: false
      t.text "token_ciphertext"
      t.string "token_bidx"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["username"], name: "index_users_on_username", unique: true
      t.index ["token_bidx"], name: "index_users_on_token_bidx", unique: true
    end
    add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
    add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
    add_foreign_key "consults", "patients"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
