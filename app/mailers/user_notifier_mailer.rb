class UserNotifierMailer < ApplicationMailer
  
  default :from => ENV["SENDGRID_EMAIL"]

  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Merci pour ton inscription' )
  end
  
  # send a lost email to the user, pass in the user object that contains the user's email address and password
  def send_lost_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Mot de passe perdu' )
  end
  
  # send a negative email to the user, pass in the user object that contains the user's email address and password
  def send_negative_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Compte bar en négatif !' )
  end
  
end
