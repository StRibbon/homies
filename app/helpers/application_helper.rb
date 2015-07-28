module ApplicationHelper
  def total_expense_amount_sphere(sphere)
    Expense.where(sphere_id: sphere.id).sum("cost")
  end

  def total_expense_by_category(sphere_id)
    sql = "SELECT sum(e.cost), c.name from users u, expenses e, categories c where u.id = e.user_id and c.id = e.category_id and sphere_id = #{sphere_id} group by c.name;"
    results = ActiveRecord::Base.connection.execute(sql)
  end

  def total_expense_by_user(sphere_id)
    sql = "SELECT sum(e.cost), u.username from users u, expenses e, categories c where u.id = e.user_id and c.id = e.category_id and sphere_id = #{sphere_id} group by u.username;"
    results = ActiveRecord::Base.connection.execute(sql)
  end

  def itemized_expense_by_user(sphere_id, user_id)
    sql = "SELECT e.cost, e.name, u.username from users u, expenses e, categories c where u.id = e.user_id and c.id = e.category_id and e.sphere_id = #{sphere_id} and u.id = #{user_id};"
    results = ActiveRecord::Base.connection.execute(sql)
  end

  def user_id_in_sphere(sphere_id)
    Expense.where(sphere_id: sphere_id).select("user_id").distinct
  end

  def number_of_user_in_sphere(sphere_id)
    Expense.where(sphere_id: sphere_id).select("user_id").distinct.count
  end

  #TODO work in progress and maybe later

  def total_expense_by_category_by_user(sphere_id, user_id)
    sql = "SELECT sum(e.cost), c.name, u.username from users u, expenses e, categories c where u.id = e.user_id and c.id = e.category_id and sphere_id = #{sphere_id} and u.id = #{user_id} group by c.name, u.username;"
    results = ActiveRecord::Base.connection.execute(sql)
  end

end
