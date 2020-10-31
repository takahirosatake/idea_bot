class IdeaSerializer < ActiveModel::Serializer
  attributes :id
  attributes :category
  attributes :body
  def category
    object.category.name
  end
end
