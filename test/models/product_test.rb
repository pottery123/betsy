require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "products must have names" do
    product = Product.new

    assert_not product.valid?
  end

end
