class RemoveSpecialtyFromProfessionals < ActiveRecord::Migration
  def change
    remove_column :professionals, :specialty, :string
  end
end
