require "spec_helper"

describe Application do

  before :each do
  end
  
  context "Sample test" do
    it "should return ok" do
      get "/pages"
      last_response.status.should == 200
    end
  end
end
