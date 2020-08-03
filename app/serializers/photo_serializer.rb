class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :url, :bkgd_removed, :size, :animal, :google_drive_path

  def animal
    object.animal.slice(:id, :name)
  end 
end
