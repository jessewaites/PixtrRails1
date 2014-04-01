class NotificationMailer < ActionMailer::Base
  default from: "admin@pixtr.com"

  def notification_email(user)
    @user = user
    @url  = 'http://Pixtr.com/login'
    mail(to: @user.email, subject: 'Welcome to Pixtr')
  end

end
