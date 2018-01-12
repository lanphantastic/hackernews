def call_hackernews_api
  url = "https://hacker-news.firebaseio.com/v0/item/"
  max_items = "https://hacker-news.firebaseio.com/v0/maxitem.json?print=pretty"

  total_items = HTTParty.get(max_items)

  response = []

  number = 3
  number.times do
    @results = HTTParty.get("#{url}#{number}.json")
    response << @results.parsed_response
  end
  return response
end
