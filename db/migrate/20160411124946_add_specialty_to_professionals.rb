class AddSpecialtyToProfessionals < ActiveRecord::Migration
  def change
    add_reference :professionals, :specialty, index: true, foreign_key: true
  end
end
