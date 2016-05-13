require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "validations: user_name can't be blank" do
    user = User.new

    assert_not user.valid?
    assert user.errors.keys.include?(:user_name), "user_name is not in the errors hash"
  end

  test "validations: email can't be blank" do
    user = User.new

    assert_not user.valid?
    assert user.errors.keys.include?(:email), "email is not in the errors hash"
  end

  test "user model has secure password" do 
    user = User.new

    assert_respond_to user, :password_digest
    assert_respond_to user, :authenticate, "User requires has_secure_password"
  end

  test "can authenticate known users" do
    leah = users(:leah)
    assert_equal leah, User.log_in(leah.email, "password")
  end

  test "user passwords must match" do
    u = User.new(password: "dog", password_confirmation: "cat")
    assert_not u.valid?
    assert_includes u.errors.keys, :password_confirmation
  end
end
