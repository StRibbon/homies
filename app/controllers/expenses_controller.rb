class ExpensesController < ApplicationController
  def index
  	id = params[:sphere_id]
    @expenses = Expense.where(sphere_id: id)
  end

  def show
  end
end
