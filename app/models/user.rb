class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :picture, PictureUploader

  include PgSearch
  multisearchable against: [:city]

  has_one :professional, dependent: :destroy

  has_many :saveds, dependent: :destroy
end
