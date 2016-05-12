require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "validations: review  can't be blank" do
    review = Review.new

    assert_not review.valid?
    assert review.errors.keys.include?(:review_text), "title is not in the errors hash"
  end

end
