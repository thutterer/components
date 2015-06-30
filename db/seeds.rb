# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ title: 'Chicago' }, { title: 'Copenhagen' }])
#   Mayor.create(title: 'Emanuel', city: cities.first)

suppliers = Supplier.create([{title: 'HP'}, {title: 'Lenovo'}, {title: 'DELL'}])
rooms = Room.create([{title: 'R204'}, {title: 'R354'}, {title: 'R9384'}])
category = Category.create([{title: 'PC'}, {title: 'Beamer'}, {title: 'Beamer'}])

Component.create(title:"Cooler Computer", supplier: suppliers.first, room: rooms.first, category: category.first)
Component.create(title:"Druckender Drucker", supplier: suppliers[1..3].sample, room: rooms[1..3].sample, category: category[1..3].sample)
Component.create(title:"Laser Bean", supplier: suppliers[1..3].sample, room: rooms[1..3].sample, category: category[1..3].sample)
Component.create(title:"Klappernde Tastatur", supplier: suppliers[1..3].sample, room: rooms[1..3].sample, category: category[1..3].sample)
