class LoadHackernewsApiJob < ApplicationJob
  queue_as :default

  def perform

    HackernewsAPI.new.create_db

  end

end
