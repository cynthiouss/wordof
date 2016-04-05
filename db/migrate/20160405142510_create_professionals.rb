class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.references :user, index: true, foreign_key: true
      t.string :category
      t.string :specialty
      t.string :languages
      t.string :address
      t.integer :recommended_by
      t.string :phone
      t.string :prof_email

      t.timestamps null: false
    end
  end
end
