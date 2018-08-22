class SiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_address, :city

  belongs_to :user
  has_many :comments
end
