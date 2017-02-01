namespace :scheduler do

  desc "This task send an award email and is called by heroku"
  task :send_award => :environment do
    @users = User.all
    @users.each do |user|
      UserNotifierMailer.send_award_email(user).deliver
    end
  end

end
