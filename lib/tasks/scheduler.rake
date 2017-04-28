namespace :scheduler do

  desc "This task send an award email and is called by heroku"
  task :send_award => :environment do
    @users = User.all
    email = ""
    @users.each do |user|
      if (Date.today.mday == 1 && user.email != "")
        UserNotifierMailer.send_award_email(user).deliver
      end
    end
  end

end
