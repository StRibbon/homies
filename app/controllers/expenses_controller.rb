class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def show
  end
end
