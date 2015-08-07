class ConnectionsController < ApplicationController
  before_action :find_connections, only: [:index, :show, :edit, :update, :destroy]

  def index

  end

  def new
    @connection = Connection.new
    @users = User.all
  end

  def create
    @category = Category.create category_params

    if @category.save
      redirect_to categories_path, flash: {success: "#{@category.name} created!"}
    else
      render :new
    end
  end

  def show
  end

  def edit
    @users = User.all
  end

  def update
    @category.update category_params
    if @category.save
      redirect_to categories_path, flash: {success: "#{@category.name} updated!"}
    else
      render :edit
    end
  end

  def destroy
  	@connection = Connection.find_by_id(params[:id])
      if(@connection.user_id == current_user.id)
        @connection.destroy
        redirect_to user_spheres_path(current_user.id)
      else   
        @connection.destroy
        redirect_to connections_path(@connection.sphere_id), flash: {success: "Connection Deleted!"}
      end
  end

  private

  def category_params
    params.require(:category).permit(
    :name,
    :color
    )
  end

  def find_connections
   @id = params[:sphere_id]
   @sphere = Sphere.find_by_id(params[:sphere_id])
   @connections = Connection.where(sphere_id: @id)
  end
end
