class Grid
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String
  property :folder, String
  property :total, Integer
  
  has n, :photos, :order => [:score.desc]

  def calculate_sizes
    photos = self.photos
    photos.each { |photo| photo.width = photo.height = 1 }
    photos[0].width = photos[0].height = 3
    photos[1].width = photos[1].height = 2
    photos[2].width = photos[2].height = 2
    photos.each { |photo| photo.save }
  end
end
