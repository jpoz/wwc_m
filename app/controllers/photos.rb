class Photos < Application
  # provides :xml, :yaml, :js

  def index
    @photos = Photo.all
    display @photos
  end

  def show
    @photo = Photo.get(params[:id])
    raise NotFound unless @photo
    display @photo
  end

  def new
    only_provides :html
    @photo = Photo.new
    render
  end

  def edit
    only_provides :html
    @photo = Photo.get(params[:id])
    raise NotFound unless @photo
    render
  end

  def create
    raise BadRequest, "No params passed to create a new object, check your new action view!" if params[:photo].nil?
    @photo = Photo.new(params[:photo])
    if @photo.save
      redirect url(:photo, @photo)
    else
      render :new
    end
  end

  def update
    @photo = Photo.get(params[:id])
    raise NotFound unless @photo
    if @photo.update_attributes(params[:photo]) || !@photo.dirty?
      redirect url(:photo, @photo)
    else
      raise BadRequest
    end
  end

  def destroy
    @photo = Photo.get(params[:id])
    raise NotFound unless @photo
    if @photo.destroy
      redirect url(:photos)
    else
      raise BadRequest
    end
  end

end # Photos
