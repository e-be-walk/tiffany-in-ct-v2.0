class Site < ApplicationRecord
  belongs_to :user
  has_many :windows, dependent: :destroy
  has_many :user_comments
  has_many :users, through: :user_comments

  has_attached_file :image, styles: { large: "600x600>", thumb: "100x100>"}

  validates :name, presence: true

  scope :recent, ->{ order("created_at DESC") }
  scope :active, ->{ order("site_windows_count DESC")}

end
