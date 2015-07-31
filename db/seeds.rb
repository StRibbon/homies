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
Expense.destroy_all
Category.destroy_all


u1 = User.create(username:"valentina", email:"phersonval@gmail.com", password:"valentina", img_url:"http://also.kottke.org/misc/images/brad-wilson-owl-01.jpg")
u2 = User.create(username:"stephen", email:"stribbon@icloud.com", password:"stephen", img_url:"http://also.kottke.org/misc/images/brad-wilson-owl-02.jpg")
u3 = User.create(username:"armand", email:"apaquino@gmail.com", password:"apaquino", img_url:"http://also.kottke.org/misc/images/brad-wilson-owl-03.jpg")
u4 = User.create(username:"rando", email:"spaceribbon@gmail.com", password:"rando", img_url:"http://nomiwaters.com/wp-content/uploads/2011/07/crazy-man.jpg")


c1 = Category.create(name:"Travel", color: "green")
c2 = Category.create(name:"Meals", color: "red")
c3 = Category.create(name:"Entertainment", color: "blue")
c4 = Category.create(name:"Drinks", color: "yellow")
c4 = Category.create(name:"Other", color: "yellow")
c4 = Category.create(name:"Rent", color: "yellow")
c4 = Category.create(name:"Medical", color: "yellow")
c4 = Category.create(name:"Utilities", color: "yellow")
c4 = Category.create(name:"Supplies", color: "yellow")