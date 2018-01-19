class HackernewsAPI

  # def get_all_results
  #   if Rails.env.development?
  #     return $hackernewsapi_api_result if $hackernewsapi_api_result
  #     $hackernewsapi_api_result = call_api
  #     return $hackernewsapi_api_result
  #   else
  #     return call_api
  #   end
  # end

  def create_item

    # STEP 1: Call 500 stories from Hackernews and parse its body
    url = "https://hacker-news.firebaseio.com/v0/newstories/"

    @results = HTTParty.get("#{url}.json?print=pretty")
    @top_stories = JSON.parse(@results.body)

    # STEP 2: Setup to store the new stories in an empty array
    new_stories = []

    # STEP 3: For each story(it's an id), store the 'item' into the new_stories array
    @top_stories.each do |story|
      item = HTTParty.get("https://hacker-news.firebaseio.com/v0/item/#{story}.json?print=pretty")

      new_stories << item
    end

    # response = get_all_results

    new_stories.each do |element|
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
        content: element['text']
      )
    end
  end

  def create_ask
    # STEP 1: Call 500 stories from Hackernews and parse its body
    url = "https://hacker-news.firebaseio.com/v0/askstories/"

    @results = HTTParty.get("#{url}.json?print=pretty")
    @ask_stories = JSON.parse(@results.body)

    # STEP 2: Setup to store the new stories in an empty array
    ask_stories = []

    # STEP 3: For each story(it's an id), store the 'item' into the ask_stories array
    @ask_stories.each do |ask|
      item = HTTParty.get("https://hacker-news.firebaseio.com/v0/item/#{ask}.json?print=pretty")

      ask_stories << item
    end

    ask_stories.each do |element|
      new_item = Ask.create(
        username: element['by'],
        descendants: element['descendants'],
        item_id: element['id'],
        score: element['score'],
        time: element['time'],
        title: element['title'],
        item_type: element['type'],
        url: element['url'],
        content: element['text']
      )
    end
  end

  # Invoke this method to start calling the HackernewsAPI and store the new stories into the database
  def create_db
    create_item
    create_ask
  end

  def destroy_and_create_db
    Item.destroy_all
    Ask.destroy_all
  end

end
