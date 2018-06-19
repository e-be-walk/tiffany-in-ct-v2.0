class User < ApplicationRecord
  has_secure_password
  has_many :sites
  has_many :windows, through: :sites
end
