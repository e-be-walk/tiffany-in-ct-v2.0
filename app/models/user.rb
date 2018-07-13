class User < ApplicationRecord
  has_secure_password
  has_many :sites
  has_many :windows, through: :sites
  has_many :user_comments
  has_many :user_comments, through: :sites

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  scope :active, -> { order("site_windows_count DESC")}
end
