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

# PRODUCTS = './seed_csvs/products.csv'

# CSV.foreach(PRODUCTS, headers: true) do |row|
#   Product.create(row.to_h)
# end

# SALES = './seed_csvs/sales.csv'

# CSV.foreach(SALES, headers: true) do |row|
#   Sale.create(row.to_h)
# end

# VENDORS = './seed_csvs/vendors.csv'

# CSV.foreach(VENDORS, headers: true) do |row|
#   Vendor.create(row.to_h)
# end