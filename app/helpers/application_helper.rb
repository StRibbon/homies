module ApplicationHelper
  def total_expense_amount_sphere(sphere)
    Expense.where(sphere_id: sphere.id).sum("cost")
  end

  def total_expense_by_category(sphere_id)
    sql = "SELECT sum(e.cost), c.name from users u, expenses e, categories c where u.id = e.user_id and c.id = e.category_id and sphere_id = #{sphere_id} group by c.name;"
    results = ActiveRecord::Base.connection.execute(sql)
  end
end
