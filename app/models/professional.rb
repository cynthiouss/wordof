class Professional < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:specialty_id, :languages]
  belongs_to :user
  belongs_to :specialty
  has_many :saveds
  validates :user_id, presence: true

  accepts_nested_attributes_for :specialty



end
