class RemoveCategoryFromProfessionals < ActiveRecord::Migration
  def change
    remove_column :professionals, :category, :string
  end
end
