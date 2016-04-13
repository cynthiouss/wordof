class Specialty < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:name, :category_id]

  belongs_to :category
  has_many :professionals, dependent: :destroy
end
