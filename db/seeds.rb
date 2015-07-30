# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#users
User.destroy_all
Sphere.destroy_all
Category.destroy_all
Expense.destroy_all

u1 = User.create(username:"valentina", email:"phersonval@gmail.com", password:"valentina", img_url:"http://also.kottke.org/misc/images/brad-wilson-owl-01.jpg")
u2 = User.create(username:"stephen", email:"stribbon@icloud.com", password:"stephen", img_url:"http://also.kottke.org/misc/images/brad-wilson-owl-02.jpg")
u3 = User.create(username:"armand", email:"apaquino@gmail.com", password:"apaquino", img_url:"http://also.kottke.org/misc/images/brad-wilson-owl-03.jpg")
u4 = User.create(username:"rando", email:"spaceribbon@gmail.com", password:"rando", img_url:"http://nomiwaters.com/wp-content/uploads/2011/07/crazy-man.jpg")

s1 = Sphere.create(name:"Vegas", description:"Crazy Nights", owner_id: u2.id)
s2 = Sphere.create(name:"August", description:"SF rent and sh!t", owner_id: u1.id)
s3 = Sphere.create(name:"React", description:"2 day workshop", owner_id: u3.id)

Connection.create(user: u1, sphere: s1)
Connection.create(user: u2, sphere: s1)
Connection.create(user: u3, sphere: s1)
Connection.create(user: u1, sphere: s2)
Connection.create(user: u3, sphere: s2)
Connection.create(user: u4, sphere: s2)
Connection.create(user: u2, sphere: s3)
Connection.create(user: u3, sphere: s3)

c1 = Category.create(name:"Travel", color: "green")
c2 = Category.create(name:"Meals", color: "red")
c3 = Category.create(name:"Entertainment", color: "blue")
c4 = Category.create(name:"Drinks", color: "yellow")

e1 = Expense.create(name:"Gas", cost: 60.08 , notes: "Shell on the i15", user_id: u3.id, category_id: c1.id, sphere_id: s1.id)
e2 = Expense.create(name:"Redbull", cost: 12.50 , notes: "Needed wings! 2 four packs", user_id: u2.id, category_id: c4.id, sphere_id: s1.id)
e3 = Expense.create(name:"Big ass steaks", cost: 80.69 , notes: "medium rare bone-in", user_id: u1.id, category_id: c2.id, sphere_id: s1.id)

e4 = Expense.create(name:"Gas", cost: 60.08 , notes: "Shell on the i15", user_id: u3.id, category_id: c1.id, sphere_id: s2.id)
e5 = Expense.create(name:"Redbull", cost: 12.50 , notes: "Needed wings! 2 four packs", user_id: u2.id, category_id: c4.id, sphere_id: s2.id)
e6 = Expense.create(name:"Big ass steaks", cost: 80.69 , notes: "medium rare bone-in", user_id: u1.id, category_id: c2.id, sphere_id: s3.id)
