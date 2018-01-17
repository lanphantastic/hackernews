class HackernewsAPI

  def get_all_results
    if Rails.env.development?
      return $ticketmaster_api_result if $ticketmaster_api_result
      $ticketmaster_api_result = call_api
      return $ticketmaster_api_result
    else
      return call_api
    end
  end

  def call_api
    url = "https://hacker-news.firebaseio.com/v0/newstories/"

    @results = HTTParty.get("#{url}.json?print=pretty")
    @top_stories = JSON.parse(@results.body)

    # setup to store the new stories
    new_stories = []

    @top_stories.each do |story|
      item = HTTParty.get("https://hacker-news.firebaseio.com/v0/item/#{story}.json?print=pretty")

      new_stories << item
      puts "Entry #{story}"
    end
    return new_stories
  end

  def create_item
    response = get_all_results
    response.each do |element|
      kids = element['kids']
      new_item = Item.create(
        username: element['by'],
        descendants: element['descendants'],
        item_id: element['id'],
        score: element['score'],
        time: element['time'],
        title: element['title'],
        item_type: element['type'],
        url: element['url'],
        content: element['text'],
        comment_kids: element['kids']
        # if kids.class == Array
        #   kids.each do |kid|
        #     comment_kids: kid
        #   end
        # end
      )
    end
  end
    # puts new_stories[0]['by']
    # new_stories.each do |element|
    #   puts element['by']
    #   puts element['kids']
    # end

  def create_db
    call_api
    create_item
  end

end
