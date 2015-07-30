class InviteMailer < ApplicationMailer
  def invite_user(user, email)
    @user = user
    @email = email
    @url = 'http://localhost:3000'
    mail(to: "<#{email}>", subject: "#{user.username} has invited you to join h0mie$!")
  end

end
