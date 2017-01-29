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
    @lastSpending = Operation.where(user_id: @user.id).order(date: :desc).limit(5)
    mail( :to => @user.email,
    :subject => 'Compte bar en négatif !' )
  end
  
  # send an award email
  def send_award_email()
    @users = User.all.order(lastName: :asc)
    @totalAmount = 0
    @operationLastMouth = Hash.new {}
    @operationTotal = Hash.new {}
    @users.each do |user|
      @operationTotal[user.id] = 0
      Operation.where(user_id: user.id).find_each do |operation|
        @operationTotal[user.id] = @operationTotal[user.id] + operation.sum
      end
      @operationTotal[user.id] = @operationTotal[user.id] + user.amount
      @totalAmount = @totalAmount + @operationTotal[user.id]
      totalOperationLastMouth = 0
      Operation.where(user_id: user.id).where("created_at > ?", Date.today.last_month()).find_each do |operation|
        if operation.sum < 0
          totalOperationLastMouth = totalOperationLastMouth + operation.sum
        end
      end
      @operationLastMouth[user.id] = totalOperationLastMouth
    end
    @userSorted = {}
    @operationLastMouth = @operationLastMouth.sort_by {|_key, value| value}.to_h
  
    i = 0
    @userAward = []
    @operationLastMouth.each do |key, value|
      @userAward[i] = @users.find(key).firstName + " " + @users.find(key).lastName
      i = i + 1
    end
  
    @operationLastMouth.each do |key, value|
      @user = @users.find(key)
      mail( :to => @users.find(key).email,
      :subject => 'Bar CVVR Awards !' )
    end
  end
end
