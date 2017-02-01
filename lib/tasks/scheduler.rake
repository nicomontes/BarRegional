desc "This task is called by the Heroku scheduler add-on"

task :send_award_email => :environment do
  User.send_reminders
end
