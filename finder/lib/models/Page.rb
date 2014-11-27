# create a model
class Page < ActiveRecord::Base

  after_find do |page|
    page.keywords = to_array(page.keywords)
  end

  def to_array(keywords)
    keywords.split(",").map { |key| key.strip.downcase }
  end

end
