# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(full_name: "admin", nickname: "admin", email: "admin@admin.com", password: "senha", password_confirmation: "senha", admin: true)

OrderStatus.delete_all
OrderStatus.create(id: 1, name: 'In Progress')
OrderStatus.create(id: 2, name: 'Placed')
OrderStatus.create(id: 3, name: 'Shipped')
OrderStatus.create(id: 4, name: 'Cancelled')
