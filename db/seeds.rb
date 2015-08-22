# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

pairbear_org = Organization.create(name: 'Pairbears')

thom = User.create(
  phone: '123',
  full_name: 'Thom Mahoney',
  email: 'mahoneyt@gmail.com',
)
erin = User.create(
  phone: '456',
  full_name: 'Erin Mahoney',
  email: 'erinmahoneyphoto@gmail.com',
)
bedford = User.create(
  phone: '789',
  full_name: 'Bedford Williamson',
  email: 'goodbedford@gmail.com',
)
paul = User.create(
  phone: '111',
  full_name: 'Paul Kim',
  email: 'paulkim517@gmail.com',
)

[thom, erin, bedford, paul].each do |user|
  user.organizations << pairbear_org
end

masters_of_code = Event.create(
  name: 'Masters of Code',
  organization_id: pairbear_org.id,
  start_at: Time.now,
)

burrito = Product.create(
  name: 'Burrito',
  description: "Sub par, but it's cheap",
  price: 1,
  organization_id: pairbear_org.id,
)

water = Product.create(
  name: 'Water Bottle',
  description: "Clean, delicious water",
  price: 2,
  organization_id: pairbear_org.id,
)

whiteboard = Product.create(
  name: 'Whiteboard',
  description: "Gently used, but effective",
  price: 3,
  organization_id: pairbear_org.id,
)

[burrito, water, whiteboard].each do |product|
  EventProduct.create(
    event_id: masters_of_code.id,
    product_id: product.id,
  )
end
