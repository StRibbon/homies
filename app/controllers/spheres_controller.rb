class SpheresController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :find_sphere_id, only: [:edit]

  def index
    @spheres = Sphere.all
  end

  def show
  end

  def edit

  end

  def new
    @sphere = Sphere.new
  end

  def destroy
  end

  def create
  	@sphere = @user.spheres.create sphere_params
  	@sphere.owner_id = set_owner_id
    if @sphere.save
      redirect_to user_spheres_path(@user), flash: {success: "#{@sphere.name} added!"}
    else
      render :new
    end
  end

  private
    def sphere_params
      params.require(:sphere).permit(
    	:name,
    	:description,
    	:owner_id
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

    	
end
