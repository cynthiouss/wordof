class Professional < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:category, :specialty, :languages]

  belongs_to :user
end
