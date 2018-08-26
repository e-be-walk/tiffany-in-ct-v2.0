class SiteSerializer < ActiveModel::Serializer
  attributes :id, :image, :name, :street_address, :city

  belongs_to :user
  has_many :windows
end
