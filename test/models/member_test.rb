require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@member = Member.new(name: "test", email: "test@test.com", password: "foobar", password_confirmation: "foobar")
  end

  test "test_setup" do
  	assert @member.valid?
  end

  test "empty_name" do
  	@member.name = ""
  	assert_not @member.valid?
  end

  test "name_length" do
  	@member.name = "a" * 50
  	assert_not @member.valid?
  end

  test "email_length" do
  	@member.email = "a" * 50 + "@test.com"
  	assert_not @member.valid?
  end

  test "email_validation_valid" do
  	valid_addresses = %w[member@example.com member@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
  	valid_addresses.each do |valid_address|
  		@member.email = valid_address
  		assert @member.valid?, "#{valid_address.inspect} should be valid"
  	end
  end

  test "email_validation_invalid" do
  	invalid_addresses = %w[member@example,com member_at_foo.org member.name@example. foo@bar_baz.com foo@bar+baz.com]
  	invalid_addresses.each do |invalid_address|
  		@member.email = invalid_address
  		assert_not @member.valid?, "#{invalid_address.inspect} should be invalid"
  	end
  end


  test "email_validation_unique" do
  	duplicate_member = @member.dup
  	duplicate_member.email = @member.email.upcase
  	@member.save
  	assert_not duplicate_member.valid?
  end

  test "password_empty" do
  	@member.password = @member.password_confirmation = " " * 6
  	assert_not @member.valid?
  end

  test "password_length" do
  	@member.password = @member.password_confirmation = "a" * 5
  	assert_not @member.valid?
  end
end
