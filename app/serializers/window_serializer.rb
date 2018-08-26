class WindowSerializer < ActiveModel::Serializer
  attributes :id, :image, :name, :year_created, :dedication

  belongs to :site   
end
