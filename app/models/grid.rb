class Grid
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String
  
  has n, :photos

end
