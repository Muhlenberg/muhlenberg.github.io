require 'test_helper'

class MembersEditTest < ActionDispatch::IntegrationTest
	def setup
		@member = members(:jalal)
	end

	test "invalid_edit" do
		log_in_as(@member)
		get edit_member_path(@member)
		assert_template 'members/edit'
		patch member_path(@member), member: {name: "", 
			email: "test@test", 
			password: "foo", 
			password_confirmation: "bar"
		}
		assert_template 'members/edit'
	end

	test "valid_edit" do
		log_in_as(@member)
		get edit_member_path(@member)
		assert_template 'members/edit'
		name  = "Foo Bar"
		email = "foo@bar.com"
		patch member_path(@member), member: { name:  name,
			email: email,
			password: "",
			password_confirmation: "" 
		}
		assert_not flash.empty?
		assert_redirected_to @member
		@member.reload
		assert_equal name,  @member.name
		assert_equal email, @member.email
	end
end
