# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

PRODUCTS = './seed_csvs/products.csv'

CSV.foreach(PRODUCTS, headers: true) do |row|
  Product.create(row.to_h)
end

# ORDERS = './seed_csvs/orders.csv'

# CSV.foreach(ORDERS, headers: true) do |row|
#   Order.create(row.to_h)
# end

USERS = './seed_csvs/users.csv'

CSV.foreach(USERS, headers: true) do |row|
  User.create(row.to_h)
end

# ORDERITEMS = './seed_csvs/orderitems.csv'

# CSV.foreach(ORDERITEMS, headers: true) do |row|
#   OrderItem.create(row.to_h)
# end
