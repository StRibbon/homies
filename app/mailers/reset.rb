class Reset < ApplicationMailer
  def password_reset(user)
    @user = user
    mail(to: "<#{user.email}>", subject: "h0mie$ password reset")
  end
end
