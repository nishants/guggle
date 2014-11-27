require 'spec_helper'

describe Query do
    before :each do
      @snapdeal_page = Page.new(
          :url => "www.snapdeal.com",
          :keywords => ['online', 'shopping', 'reviews'])

      @myntra_page = Page.new(
          :url => "www.myntra.com",
          :keywords => ['online', 'clothes', 'apparels'])

      @flipkart_page = Page.new(
          :url => "www.flipkart.com",
          :keywords => ['shopping', 'online', 'reviews'])

      @amazon_page = Page.new(
          :url => "www.amazon.com",
          :keywords => ['online', 'reviews', 'shopping'])
    end

   context "should return pages by weights" do
         it "should not return page if page has no common keyword with query ok" do
           query = Query.new("python")
           query.weight_of(@snapdeal_page).should == 0
           query.weight_of(@myntra_page).should   == 0
           query.weight_of(@flipkart_page).should == 0
           query.weight_of(@amazon_page).should   == 0
         end

         it "should calculate the weight of page" do
           query = Query.new("online, shopping, reviews")
           query.weight_of(@snapdeal_page).should == 194  # 9*9 + 8*8 + 7*7
           query.weight_of(@myntra_page).should == 81    # 9*9 + 0*8 + 0*7
           query.weight_of(@flipkart_page).should == 193 # 9*8 + 8*9 + 7*7
           query.weight_of(@amazon_page).should == 193 # 9*9 + 8*7 + 7*8
         end
   end
end