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

  test "products must have a price in dollars greater than 1" do
    product = Product.new
    product.name = "wedding football"
    product.quantity = 3
    product.price_in_dollars = 0.5

    assert_not product.valid?
    assert product.errors.keys.include?(:price_in_dollars), "is not a number"
  end

end
