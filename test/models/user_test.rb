require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

    def setup
    @user = User.new(user_name: "exm_user", name: "Example User", email: "user@example.com",
                     hashed_password: "password")
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  	end
  end

  # test "email validation should accept valid addresses" do
  #   valid_addresses = %w[USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
  #   valid_addresses.each do |valid_address|
  #     @user.email = valid_address
  #    assert @user.valid?, "#{valid_address.inspect} should be valid"
  #   end
  # end
  
  # test "authenticated? should return false for a user with nil digest" do
  #   assert_not @user.authenticated?(:remember, '')
  # end

  # test "should be valid" do
  #   assert @user.valid?
  # end


  test "user name should be present" do
    @user.user_name = ""
    assert_not @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
  test "user name should not be too long" do
    @user.user_name = "a" * 26
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 76
    assert_not @user.valid?
  end

#   test "password should have a minimum length" do
#     @user.hashed_password = "aaaaa"
#     assert_not @user.valid?
#   end
  
#   test "email addresses should be unique" do
#     duplicate_user = @user.dup
#     duplicate_user.email = @user.email.upcase
#     duplicate_user.save
#     assert_not duplicate_user.valid?
#   end
  
#   test "user name should be unique" do
#     duplicate_user = @user.dup
#     duplicate_user.user_name = @user.user_name.upcase
#     duplicate_user.save
#     assert_not duplicate_user.valid?
#   end

# # test "associated microposts should be destroyed" do
#     @user.save
#     @user.microposts.create!(content: "Lorem ipsum")
#     assert_difference 'Micropost.count', -1 do
#       @user.destroy
#     end
  # end
end
