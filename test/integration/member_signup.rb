require 'test_helper'

class MemberSignupTest < ActionDispatch::IntegrationTest
  test "valid signup information" do
    get signup_path
    assert_difference 'Member.count', 1 do
      post_via_redirect members_path, member: { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'members/show'
  end
end