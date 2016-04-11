class CreateSaveds < ActiveRecord::Migration
  def change
    create_table :saveds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :professional, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
