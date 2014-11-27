class Query
  @@MAX_KEYWORDS = 9

  def initialize query
    @keywords_weights = weights_of(keywords_in(query))
  end

  def weights_of(keywords)
    weights = {}
    (0...keywords.length).each { |i|
      weights[keywords[i]] = weight_of_index(i)
    }
    weights
  end

  def weight_of_index(i)
    i.nil? ? 0 : @@MAX_KEYWORDS - Integer(i)
  end

  def keywords_in(keywords)
    keywords.split(",").map { |key| key.strip.downcase }
  end

  def weight_of page
    page_weight = 0
    @keywords_weights.each {|key, value|
      page_weight += value * weight_of_index(page.keywords.index(key))
    }
    page_weight
  end
end