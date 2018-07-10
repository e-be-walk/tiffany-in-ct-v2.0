class UserComment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :site, optional: true

  validates :comment_text, presence: true

end
