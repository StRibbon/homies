class SessionsController < ApplicationController
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
    if @User.save
      session[:user_id] = @User.user_id
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
        redirect_to user_spheres_path(found_user), flash: {success: "Welcome back #{found_user.email}!"}
      else
        flash[:alert] = "email / password combination is invalid"
        redirect_to login_path(@user)
      end
    else
      flash[:alert] = "please enter email and password"
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
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
