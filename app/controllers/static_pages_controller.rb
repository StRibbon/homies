class StaticPagesController < ApplicationController
  def about
  end

  def invite
  	
  end

  def email_invite
  	@invite = Invite.create(email: params[:email])
  	InviteMailer.invite_user(current_user, params[:email]).deliver_now 	
  	redirect_to user_spheres_path(user_id: session[:user_id]), flash: {success: "#{params[:email]} has been invited!"}
  end
end
