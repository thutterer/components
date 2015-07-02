require 'faker'


50.times { |x| Supplier.create({title: Faker::Company.name})}
50.times { |x |Room.create({title: "Raum-#{x}"})}
50.times { |x| Category.create({title: Faker::Commerce.department})}

Attribute.create(title: 'Bemerkung')
Attribute.create(title: 'Lange Beschreibung')
Attribute.create(title: 'Dummy')

50.times { |x| Component.create(quantity: Faker::Number.number(3), title:Faker::Hacker.abbreviation, supplier: Supplier.all.sample, room: Room.all.sample, category: Category.all.sample, invoice: Time.new(2009, 10, 11))}

Role.create(name: "Admin")
Role.create(name: "Systembetreuer")
Role.create(name: "Lehrer")
Role.create(name: "Gast")

User.create(email: "admin@admin.com", password: "admin12345", password_confirmation: "admin12345", role_id: 1)
User.create(email: "system@betreuer.com", password: "admin12345", password_confirmation: "admin12345", role_id: 2)
User.create(email: "lehrer@lehrer.com", password: "admin12345", password_confirmation: "admin12345", role_id: 3)
