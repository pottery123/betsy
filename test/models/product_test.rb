require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "products must have names" do
    product = Product.new

    assert_not product.valid?
    assert product.errors.keys.include?(:name), "can't be empty"
  end

  test "products must have a whole number quantity" do
    product = Product.new
    product.name = "wedding football"
    product.quantity = 0.3
    product.price_in_dollars = 10

    assert_not product.valid?
    assert product.errors.keys.include?(:quantity), "is not a number"
  end

  test "products must have a quantity greater than 0" do
    product = Product.new
    product.name = "wedding football"
    product.quantity = -3
    product.price_in_dollars = 10

    assert_not product.valid?
    assert product.errors.keys.include?(:quantity), "is not a number"
  end

  test "products must have a price in dollars greater than or equal to 1" do
    product = Product.new
    product.name = "wedding football"
    product.quantity = 3
    product.price_in_dollars = 0.5

    product_two = Product.new
    product.name = "wedding football"
    product.quantity = 3
    product.price_in_dollars = -6

    assert_not product.valid?
    assert product.errors.keys.include?(:price_in_dollars), "is not a number"

    assert_not product_two.valid?
    assert product.errors.keys.include?(:price_in_dollars), "is not a number"
  end
  
  test "products may take a decimal price in dollars" do
    product = Product.new
    product.name = "wedding football"
    product.quantity = 3
    product.price_in_dollars = 1.5

    assert product.valid?
  end

end
