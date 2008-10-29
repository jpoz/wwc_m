class Photo
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String
  property :link, Text
  property :width, Integer
  property :height, Integer
  property :score, Integer, :default => 0
  
  belongs_to :grid

end
