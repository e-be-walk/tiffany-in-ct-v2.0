class WindowSerializer < ActiveModel::Serializer
  attributes :id, :image, :site_id, :name, :year_created, :dedication

  belongs_to :site
end
