class SpheresController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :edit, :update]
  before_action :find_sphere_id, only: [:edit, :update, :destroy]
  before_action :ensure_correct_user_for_sphere_edit, only: [:update, :edit, :destroy]
  
  def index
    @spheres = Sphere.joins(:connections).where(connections: {user_id: @user.id})
  end

  def show
  end

  def edit
    @users = User.all
  end

  def update
    @sphere.update sphere_params
    if @sphere.save
      redirect_to user_sphere_expenses_path(@user, @sphere), flash: {success: "#{@sphere.name} updated!"}
    else
      render :edit
    end
  end

  def new
    @users = User.all
    @sphere = Sphere.new
  end

  def destroy
    @sphere.destroy
    redirect_to user_spheres_path, flash: {success: "#{@sphere.name} Deleted!"}
  end

  def create
    @users = User.all
  	@sphere = @user.spheres.create sphere_params
  	@sphere.owner_id = set_owner_id
    if @sphere.save
      @users_added = User.joins(:connections).where(connections: {sphere_id: @sphere.id})
        @users_added.each do |homie|
          binding.pry        
          UserMailer.user_added(homie, @sphere).deliver_now
        end
      redirect_to user_sphere_expenses_path(sphere_id: @sphere.id), flash: {success: "#{@sphere.name} added!"}
    else
      render :new
    end
  end

  private
    def sphere_params
      params.require(:sphere).permit(
    	:name,
    	:description,
    	:owner_id,
      :user_ids => []
      )
    end
    def set_user
      @user = User.find params[:user_id]
    end
    def set_owner_id
      @owner = session[:user_id]
    end
    def find_sphere_id
      @sphere = Sphere.find params[:id]
    end
    def ensure_correct_user_for_sphere_edit
      sphere = Sphere.find params[:id]
      unless sphere.owner_id == session[:user_id].to_s
        return redirect_to user_spheres_path(sphere_id: sphere), flash: {warning: "You are not authorized to edit: #{@sphere.name}"}
      end
    end


end
