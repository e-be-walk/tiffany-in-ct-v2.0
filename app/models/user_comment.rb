class UserComment < ApplicationRecord
  belongs_to :user
  belongs_to :window
  belongs_to :site

end
