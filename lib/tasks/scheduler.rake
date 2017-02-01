namespace :scheduler do

  desc "This task send an award email and is called by heroku"
  task :send_award => :environment do
    @users = User.all
    email = ""
    @users.each do |user|
      email = email + ", " + user.email
    end
    puts email
    #UserNotifierMailer.send_award_email(email).deliver
  end

end
