desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  NewsFeed.update
  puts "done."
end

task :send_award_email => :environment do
  User.send_reminders
end
