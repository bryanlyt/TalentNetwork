class UserMailer < ApplicationMailer
  def talent_application_confirmation(user, talent)
    @user = user
    @talent = talent
    mail(to: @user.email, subject: 'Application confirmed')
  end
end