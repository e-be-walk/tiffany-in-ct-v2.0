class Site < ApplicationRecord
  belongs_to :user
  has_many :windows, dependent: :destroy
  has_many :user_comments
  has_many :users, through: :user_comments

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, presence: true

  scope :recent, ->{ order("created_at DESC") }
  scope :active, ->{ order("site_windows_count DESC")}

  def next
    site = Site.where("id > ?", id).first

    if site
      site
    else
      Site.first
    end
  end
end
