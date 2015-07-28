module ApplicationHelper
  def total_expense_amount_sphere(sphere)
    Expense.where(sphere_id: sphere.id).sum("cost")
  end
end
