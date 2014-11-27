class Search
  def self.by_query(query, pages)
    Search.new(query, pages).result()
  end

  def initialize(query, pages)
    @query = Query.new(query)
    @pages = pages
  end

  def result
    search_result = {}
    @pages.each {  |page|
      weight = @query.weight_of(page)
      search_result[weight] = page if(weight > 0)
    }
    search_result.sort_by {|weight, page| weight}.map {|value| value[1]}.reverse
  end
end
