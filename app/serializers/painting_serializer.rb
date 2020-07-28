class PaintingSerializer < ActiveModel::Serializer
  attributes :id, :animal, :painting_url, :painting_status, :gallery_id, :painter, :paint_location_id, :card_stock

end
