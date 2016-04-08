class Professional < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:category, :specialty, :languages]

  belongs_to :user

  validates :user_id, presence: true
end
