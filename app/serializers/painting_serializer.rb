class PaintingSerializer < ActiveModel::Serializer
  attributes :id, :animal, :visible_url, :google_drive_url, :painting_status, :gallery_id, :painter, :paint_location_id, :card_stock

  def visible_url
    object.get_visible_google_drive_url
  end 

end
