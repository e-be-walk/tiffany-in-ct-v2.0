class Site < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :windows

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  #pg_search_scope :search_any_word,
  #                :against => :text,
  #                :using => {
  #                  :tsearch => {:any_word => true}
  #                }
  #pg_search_scope :search_all_words,
  #                :against => :text

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
