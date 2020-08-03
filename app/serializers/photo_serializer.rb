class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :bkgd_removed, :size, :animal, :file_path, :url

  def animal
    object.animal.slice(:id, :name)
  end 

  def url
    if object.google_drive_url
      object.split('https://drive.google.com/file/d/')[1]
			.split('/view?usp=sharing')[0];
    else 
      object.url
    end 
  end 
end
