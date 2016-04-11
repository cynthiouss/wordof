class Category < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:name]

  has_many :specialties
end
