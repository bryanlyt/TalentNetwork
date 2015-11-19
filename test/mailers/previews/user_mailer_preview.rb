# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
class UserMailerPreview < ActionMailer::Preview
  def talent_application_confirmation_preview
    UserMailer.talent_application_confirmation(User.second, Talent.first)
  end
end
