class UserMailer < ApplicationMailer
  def user_added(user, sphere)
    @user = user
    @sphere = sphere
    @url = ENV['URL']
    mail(to: "<#{user.email}>", subject: "h0mie$: You have been added to a Sphere")
  end
end
