require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "validate name is present and unique" do
    category = Category.new
    assert_not category.valid?
    assert category.errors.keys.include?(:name), "name is not in the errors hash"
  end
end
