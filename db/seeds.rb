# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
suppliers = Supplier.create([{title: 'HANNS-G'}, {title: 'HP'}, {title: 'DELL'}])
rooms = Room.create([{title: 'Labor 001'}, {title: 'Labor 002'}, {title: 'Computerraum 112'}])
category = Category.create([{title: 'PC'}, {title: 'Monitor'}, {title: 'Laptop'}, {title: 'Drucker'}, {title: 'Beamer'}])

Attribute.create(title: 'Bemerkung')

Component.create(quantity: 10, title:"BenQ X3000", supplier: suppliers.first, room: rooms.first, category: category[1], invoice: Time.new(2009, 10, 11))
Component.create(quantity: 5, title:"HP Laserjet 5L", supplier: suppliers[1], room: rooms.first, category: category[3], invoice: Time.new(2012, 12, 8))
Component.create(quantity: 20, title:"DELL 87", supplier: suppliers[2], room: rooms[1], category: category[4], invoice: Time.new(2015, 7, 1))
Component.create(quantity: 1, title:"DELL 500", supplier: suppliers[2], room: rooms[2], category: category[2], invoice: Time.new(1986, 6, 4))
#suppliers = Supplier.create([{title: 'HP'}, {title: 'Lenovo'}, {title: 'DELL'}])
#rooms = Room.create([{title: 'R204'}, {title: 'R354'}, {title: 'R9384'}])
#category = Category.create([{title: 'PC'}, {title: 'Beamer'}, {title: 'Beamer'}])

Role.create(name: "Admin")
Role.create(name: "Systembetreuer")
Role.create(name: "Lehrer")
Role.create(name: "Gast")

User.create(email: "admin@admin.com", password: "admin12345", password_confirmation: "admin12345", role_id: 1)
User.create(email: "system@betreuer.com", password: "admin12345", password_confirmation: "admin12345", role_id: 2)
User.create(email: "lehrer@lehrer.com", password: "admin12345", password_confirmation: "admin12345", role_id: 3)
