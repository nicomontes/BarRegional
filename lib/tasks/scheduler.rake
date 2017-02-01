namespace :scheduler do

  desc "This task send an award email and is called by heroku"
  task :send_award => :environment do
    UserNotifierMailer.send_award_email().deliver
  end

end
