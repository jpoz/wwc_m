class Grids < Application
  # provides :xml, :yaml, :js
  before :ensure_authenticated, :exclude => [:index, :show]
  
  def index
    @grids = Grid.all
    display @grids
  end

  def show
    @grid = Grid.get(params[:id])
    raise NotFound unless @grid
    display @grid
  end

  def new
    only_provides :html
    @grid = Grid.new
    render
  end

  def edit
    only_provides :html
    @grid = Grid.get(params[:id])
    raise NotFound unless @grid
    render
  end

  def create
    raise BadRequest, "No params passed to create a new object, check your new action view!" if params[:grid].nil?
    @grid = Grid.new(params[:grid])
    if @grid.save
      @grid.total.times do |number|
        ## AHHHHH refactor me!!!!
        @grid.photos.create(:title => "Photo #{number+1}", :width => 1, :height => 1, :link => "/photos/#{@grid.folder}/#{number+1}_")
      end
      redirect url(:grid, @grid)
    else
      render :new
    end
  end
  
  

  def update
    @grid = Grid.get(params[:id])
    raise NotFound unless @grid
    if @grid.update_attributes(params[:grid]) || !@grid.dirty?
      redirect url(:grid, @grid)
    else
      raise BadRequest
    end
  end

  def destroy
    @grid = Grid.get(params[:id])
    raise NotFound unless @grid
    if @grid.destroy
      redirect url(:grids)
    else
      raise BadRequest
    end
  end

end # Grids
