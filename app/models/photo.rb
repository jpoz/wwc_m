class Photo
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String
  property :link, Text
  property :width, Integer
  property :height, Integer
  
  belongs_to :grid
  
  def to_html
    w = width*50
    h = height*50
    "<div class='grid_unit' style=\"width: #{w}px; height: #{h}px;\">
      <img src='/images#{link}#{w}.jpg' />
    </div>"
  end

end
