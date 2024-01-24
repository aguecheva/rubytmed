class CreateConsults < ActiveRecord::Migration[7.1]
  def change
    create_table :consults do |t|
      t.text :description
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
