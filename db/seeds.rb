require 'faker'


['Lager', 'Wartung', 'Archiv', 'Labor 1', 'Labor 2', 'Lehrerzimmer OG1', 'Lehrerzimmer OG2'].each { |title| Room.create(title: title) }
%w(PC Beamer Laptop Router Switch Monitor Grafikkarte SSD Software Betriebssystem).each { |title| Category.create(title: title) }
['Bemerkung', 'CPU-Sockel', 'RAM-Typ', 'Leistung (W)', 'Grafik-Schnittstelle', 'Lampentyp'].each { |title| Attribute.create(title: title) }

15.times { |x| Supplier.create({title: Faker::Company.name})}
20.times { |x| Room.create({title: "R#{format('%03d', rand(300))}"})}
#30.times { |x| Category.create({title: Faker::Commerce.department})}

100.times { |x| Component.create(quantity: Faker::Number.number(2), title:Faker::Hacker.abbreviation, supplier: Supplier.all.sample, room: Room.all.sample, category: Category.all.sample, invoice: Time.new(2009, 10, 11))}

Role.create(name: "Admin")
Role.create(name: "Systembetreuer")
Role.create(name: "Lehrer")
Role.create(name: "Gast")

User.create(email: "admin@admin.com", password: "admin12345", password_confirmation: "admin12345", role_id: 1)
User.create(email: "system@betreuer.com", password: "admin12345", password_confirmation: "admin12345", role_id: 2)
User.create(email: "lehrer@lehrer.com", password: "admin12345", password_confirmation: "admin12345", role_id: 3)
