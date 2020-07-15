class PaintingSerializer < ActiveModel::Serializer
  attributes :id, :animal, :painting_url, :status

  def animal
    object.animal
  end
end
