
desc "This task calls the HackernewsAPI"
task :create_or_update_db => :environment do
    require "#{Rails.root}/app/models/concerns/hackernewsapi.rb"
    HackernewsAPI.new.create_db
end
