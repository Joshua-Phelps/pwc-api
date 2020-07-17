class PaintingSerializer < ActiveModel::Serializer
  attributes :id, :animal, :painting_url, :painting_status, :gallery_id

  def animal
    object.animal
  end
end
