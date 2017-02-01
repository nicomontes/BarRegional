namespace :scheduler do

  desc "This task send an award email and is called by heroku"
  task :send_award => :environment do
    @users = User.all
    email = ""
    @users.each do |user|
      puts user.firstName
      puts user.email
    end
    #UserNotifierMailer.send_award_email(email).deliver
  end

end
