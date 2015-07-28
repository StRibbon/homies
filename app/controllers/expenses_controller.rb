class ExpensesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :edit, :update]
  before_action :find_sphere_id, only: [:new, :edit, :update]
  before_action :find_expense_id, only: [:edit, :update, :destroy]

  def index
  	id = params[:sphere_id]
    @expenses = Expense.where(sphere_id: id)
  end

  def show
  end

  def new
  	@expense = Expense.new
  	@categories = Category.all
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
    sphere_id = params[:sphere_id]
    redirect_to user_sphere_expenses_path(sphere_id: params[:sphere_id], user_id: params[:user_id]), flash: {success: "#{@expense.name} Deleted!"}
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
