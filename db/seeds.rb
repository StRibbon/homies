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

user1 = User.create(username:"valentina", email:"phersonval@gmail.com", password:"valentina")
user2 = User.create(username:"stephen", email:"stribbon@icloud.com", password:"stephen")
user3 = User.create(username:"armand", email:"apaquino@gmail.com", password:"apaquino")
user4 = User.create(username:"rando", email:"spaceribbon@gmail.com", password:"rando")

sphere1 = Sphere.create(name:"Vegas", description:"Crazy Nights")
sphere2 = Sphere.create(name:"August", description:"SF rent and sh!t")

Connection.create(user: user1, sphere: sphere1)
Connection.create(user: user2, sphere: sphere1)
Connection.create(user: user3, sphere: sphere1)
Connection.create(user: user2, sphere: sphere2)
Connection.create(user: user3, sphere: sphere2)
