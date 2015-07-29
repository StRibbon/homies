class ExpensesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :find_sphere_id, only: [:new]
  before_action :find_expense_id, only: [:edit, :destroy, :update]
 
  def index
  	@id = params[:sphere_id]
    @sphere = Sphere.find(@id)
    @expenses = Expense.where(sphere_id: @id)
    @connections = Connection.where(sphere_id: @id)
  end

  def show
  end

  def new
  	@expense = Expense.new
  	@categories = Category.all
  end
  def edit
    @categories = Category.all
  end
  def update
    @expense.update expense_params
    sphere_id = Expense.last.sphere_id
    user_id = Expense.last.user_id
    if @expense.save
      redirect_to user_sphere_expenses_path(sphere_id: sphere_id, user_id: user_id), flash: {success: "#{@expense.name} updated!"}
    else
      render :edit
    end
  end

  def create

    @expense = Expense.create expense_params
    @expense.user_id = params[:user_id]
    @expense.sphere_id = params[:sphere_id]
    if @expense.save
      sphere_id = params[:sphere_id]
      redirect_to user_sphere_expenses_path(@user, sphere_id: sphere_id), flash: {success: "#{@expense.name} added!"}
    else
      render :new
    end
  end

  def destroy
    @expense.destroy
    redirect_to user_sphere_expenses_path(sphere_id: @expense.sphere_id, user_id: @expense.user_id), flash: {success: "#{@expense.name} Deleted!"}
  end

  private
    def expense_params
    	params.require(:expense).permit(:name, :cost, :notes, :category_id)
    end
    def set_user
      @user = User.find params[:user_id]
    end
    def find_sphere_id
      @sphere = Sphere.find params[:sphere_id]
    end
    def find_expense_id
      @expense = Expense.find params[:id]
    end
end
