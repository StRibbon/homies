class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:show,:edit, :update, :destroy]
  # before_action :check_invite, only: [:create]
	
  def index
  	@users = User.all
  end
  def new
	@user = User.new
  end
  def show
  end
  def create
    user_email = params['user']['email']
    invite = Invite.find_by_email(user_email)
    if(invite)
      invite_email = invite.email
    end
      if(user_email == invite_email)
        @user = User.new user_params
          if @user.save
            session[:user_id] = @user.id
            redirect_to user_spheres_path(session[:user_id]), flash: {success: "Created!"}
          else
            render :new
          end
      else 
        redirect_to root_path, flash: {alert: "Sorry you have not been invited yet"}
      end
  end
  private

    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(
        :username,
        :password,
        :email,
        :img_url
    )
    end

    def ensure_correct_user
      # compare some params vs something in the session/current_user
        unless params[:id].to_i == session[:user_id]
          redirect_to user_spheres_path, alert: "Not Authorized"
      end
    end

end
