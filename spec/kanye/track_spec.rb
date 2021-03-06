require 'spec_helper'

describe Kanye::Track do
  before do
    @track = Kanye::Track.new(:id => 'id', :key => 'key', :artist => 'Alan Braxe', :title => 'Rubicon', :cookie => 'cookie')
  end
  
  describe "url" do
    it "should contain contain :id and :key" do
      @track.url.should == "http://#{Kanye::BASE_URL}/serve/source/id/key"
    end
  end
  
  describe "to_s" do
    it "should display the key, artist, and title" do
      @track.to_s.should == "(key, Rubicon, Alan Braxe)"
    end
  end
  
  describe "download!" do
    before do
      HTTParty.stub!(:get) { mock(:response, :parsed_response => {}, :code => 200) }
      File.stub!(:open)
      Mp3Info.stub!(:open)
    end
    
    it "should request mp3 with cookie" do
      HTTParty.should_receive(:get).with(@track.url, {:headers => {"cookie" => @track.cookie}})
      @track.download!
    end
    
    # This spec could use some love
    it "should set ID3 tags" do
      @track.should_receive(:set_id3_tags!)
      @track.download!
    end
  end
end
