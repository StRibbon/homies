class UserMailer < ApplicationMailer
  def user_added(user, sphere)
    @user = user
    @sphere = sphere
    @url = 'http://localhost:3000'
    mail(to: "<#{user.email}>", subject: "h0mie$: You have been added to a Sphere")
  end
end
