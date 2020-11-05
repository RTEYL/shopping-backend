require 'faker'

20.times do
  Item.create(
    brand: Faker::Company.name,
    category: Faker::Commerce.department(max: 2),
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Commerce.price
  )
end