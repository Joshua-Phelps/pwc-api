class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :size, :animal, :file_path, :url

  def animal
    object.animal.slice(:id, :name)
  end 

  def url
    if object.google_drive_url
      object.get_visible_google_drive_url
    else 
      object.url
    end 
  end 
end
