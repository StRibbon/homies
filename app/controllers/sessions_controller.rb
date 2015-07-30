class SessionsController < ApplicationController
  before_action :prevent_login_signup, only: [:signup, :create, :login, :attempt_login] 

  def index
    @spheres = Sphere.all
  end

  def signup
    @user = User.new
  end

  def login
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.user_id
      redirect_to home_path
    else
      render :signup
    end
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first
      if found_user && found_user.authenticate(params[:password])
        session[:user_id] = found_user.id
        redirect_to user_spheres_path(found_user), flash: {success: "Welcome back #{found_user.email}"}
      else
        flash[:alert] = "Email / Password combination is invalid"
        redirect_to login_path(@user)
      end
    else
      flash[:alert] = "Please enter email and password"
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to login_path
  end

  private
    def user_params
      params.require(:user).permit(
        :username,
        :email,
        :password,
        :img_url
        )
    end
end
