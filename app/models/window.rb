class Window < ApplicationRecord
  belongs_to :site, counter_cache: :site_windows_count
  belongs_to :user
  #has_many :user_comments
  #has_many :users, through: :user_comments

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, presence: true

end
