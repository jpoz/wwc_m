require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a grid exists" do
  Grid.all.destroy!
  @grid = Grid.create(:title => "James rocks")
end

given "the grid has 10 photos" do
  Photo.all.destroy!
  10.times do
    Photo.create(:grid => @grid)
  end
end

describe Grids, :given => "a grid exists" do
  
  before(:each) do
    @response = request('/grids')
  end
  
  it "should be successfull" do
    @response.should be_successful
  end
  
  it 'should return grids title' do
    @response.body.
      should include('James rocks')
  end
  
end

describe Grids, :given => 'the grid has 10 photos' do
  before(:each) do
    @response = request('/grids')
  end
  
  it "should return images" do
    @response.should have_xpath("//img")
  end
end