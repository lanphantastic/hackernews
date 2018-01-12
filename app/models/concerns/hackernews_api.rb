class HackernewsAPI

  def get_all_results
    if Rails.env.development?
      return $ticketmaster_api_result if $ticketmaster_api_result
      $ticketmaster_api_result = call_items_api
      return $ticketmaster_api_result
    else
      return call_items_api
    end
  end

  def call_items_api
    call = get_all_results
    url = "https://hacker-news.firebaseio.com/v0/item/"
    max_items = "https://hacker-news.firebaseio.com/v0/maxitem.json?print=pretty"

    # total_entry = HTTParty.get(max_items)
    total_entry = 10

    response = []

    # setup the count loop
    number = 0

    total_entry.times do
      @results = HTTParty.get("#{url}#{number}.json")
      parsed_results = JSON.parse(@results.body)
      if parsed_results.class == Hash
      response << parsed_results
      end
      number += 1
    end
    return response

  end

  def create_db
    call_items_api
  end

end
