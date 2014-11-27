require "spec_helper"

describe Application do

  before :each do
    Page.delete_all

    @snapdeal_page = Page.create(
        :url => "www.snapdeal.com",
        :keywords => "online, shopping, reviews")

    @myntra_page = Page.create(
        :url => "www.myntra.com",
        :keywords => "online, , clothes, apparels,")

    @flipkart_page = Page.create(
        :url => "www.flipkart.com",
        :keywords => "shopping, online, reviews,")

    @amazon_page = Page.create(
        :url => "www.amazon.com",
        :keywords => "online, reviews, shopping")
  end

  def tokenize_keywords page
    page.keywords = page.keywords.split(",").map { |key| key.strip.downcase }
    page
  end

  context "Should fetch result by keywords" do
    it "should return ok" do
      get "/pages", :query => "online, shopping"
      last_response.body.should == [
          tokenize_keywords(@snapdeal_page),
          tokenize_keywords(@flipkart_page),
          tokenize_keywords(@amazon_page),
          tokenize_keywords(@myntra_page)].to_json
    end

  end
end