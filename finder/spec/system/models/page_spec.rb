require "spec_helper"

describe Application do

  before :each do
    Page.delete_all
    @page = Page.create(:url => 'flipkart.com',
             :keywords => 'online, Shopping, REVIEWS')
  end
  
  context "Fetch pages" do
    it 'should fetch page and tokenize keywords' do
      page = Page.all[0]
      page.url.should == 'flipkart.com'
      page.keywords.should == ['online', 'shopping', 'reviews']
    end
  end
end
